import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/search_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/build_search_grid_view.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/search_cubit/search_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/search_cubit/search_state.dart';

class SearchScreen extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(onPressed: ()
    {
      buildResults(context);
    }, icon: const Icon(Icons.search),color: Colors.black54);
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()
    {
      Navigator.pop(context);
    }, icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
   return BlocProvider(
     create: (context) => SearchCubit(SearchUseCase(HomeRepoImpl(homeBaseRemoteDataSource:
     HomeRemoteDataSource(),),),)..searchProduct(query: query),
     child: BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchLoading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is SearchFailure){
          print(state.errMessage);
        }else if(state is SearchSuccess){
          return BuildSearchGridView(model: state.searchEntity);
        }
        return const SizedBox();
      },
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchUseCase(HomeRepoImpl(homeBaseRemoteDataSource:
      HomeRemoteDataSource(),),),)..searchProduct(query: query),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if(state is SearchLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if(state is SearchFailure){
            print(state.errMessage);
          }else if(state is SearchSuccess){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BuildSearchGridView(model: state.searchEntity),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

}


