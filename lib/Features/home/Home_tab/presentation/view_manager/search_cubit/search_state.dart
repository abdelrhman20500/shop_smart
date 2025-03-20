import 'package:shop_smart/Features/home/Home_tab/domain/entities/search_entity.dart';

abstract class SearchState{}
class SearchInitial extends SearchState{}
class SearchLoading extends SearchState{}
class SearchFailure extends SearchState{
  final String errMessage;
  SearchFailure({required this.errMessage});
}
class SearchSuccess extends SearchState{
  final List<SearchEntity> searchEntity;
  SearchSuccess({required this.searchEntity});
}
