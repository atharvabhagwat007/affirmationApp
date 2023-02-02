import 'package:dailyAffirmationss/data/data_sources/affirmation_categories_data_source.dart';
import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';
import 'package:dailyAffirmationss/core/networking/failure.dart';
import 'package:dailyAffirmationss/domain/repositories/affirmation_categories_repository.dart';
import 'package:dartz/dartz.dart';

class AffirmationCategoryRepositoryImpl extends AffirmationCategoryRepository {
  final AffirmationCategoryDataSource _affirmationCategoryDataSource;

  AffirmationCategoryRepositoryImpl(this._affirmationCategoryDataSource);
  @override
  Future<Either<Failure, List<AffirmationEntity>>> getAffirmationCategories() {
    return _affirmationCategoryDataSource.getAffirmationCategories();
  }
}
