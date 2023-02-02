import 'package:dailyAffirmationss/core/networking/network_service.dart';
import 'package:dailyAffirmationss/data/data_sources/affirmation_categories_data_source.dart';
import 'package:dailyAffirmationss/data/repositories/affirmation_categories_repository_impl.dart';
import 'package:dailyAffirmationss/domain/repositories/affirmation_categories_repository.dart';
import 'package:dailyAffirmationss/domain/use_cases/affiramtion_category_usecase.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_bloc.dart';
import 'package:kiwi/kiwi.dart';

part 'di.g.dart';

abstract class Injector {
  static KiwiContainer? _di;

  static void setUp() {
    _di = KiwiContainer();
    _$Injector().configure();
  }

  static get resolve => _di!.resolve;

  //Region core
  @Register.singleton(NetworkService)
  //end region core

  @Register.factory(AffirmationCategoryDataSource)
  @Register.factory(AffirmationCategoryRepository,
      from: AffirmationCategoryRepositoryImpl)
  @Register.factory(AffirmationCategoryUseCase)
  @Register.factory(HomeBloc)
  void configure();
}
