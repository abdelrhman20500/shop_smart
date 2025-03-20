import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/search_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

class SearchUseCase extends BaseUseCase<List<SearchEntity> , SearchParameters>
{
  final HomeRepo homeRepo;

  SearchUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(SearchParameters parameters)async
  {
    return await homeRepo.searchAboutProduct(parameters);
  }

}
