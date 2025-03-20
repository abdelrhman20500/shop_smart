import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/search_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchUseCase): super(SearchInitial());
  final SearchUseCase searchUseCase;

  void searchProduct({required String query})async{
    emit(SearchLoading());
    final parameters = SearchParameters(text: query);
    var result = await searchUseCase.call(parameters);
    result.fold((e){
      emit(SearchFailure(errMessage: e.message));
    }, (searchEntity){
      emit(SearchSuccess(searchEntity: searchEntity));
    });
  }
}