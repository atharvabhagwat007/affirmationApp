import 'package:dailyAffirmationss/core/networking/failure.dart';
import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';
import 'package:dailyAffirmationss/domain/repositories/affirmation_categories_repository.dart';
import 'package:dartz/dartz.dart';

class AffirmationCategoryUseCase {
  final AffirmationCategoryRepository _affirmationCategoryRepository;

  AffirmationCategoryUseCase(this._affirmationCategoryRepository);

  Future<Either<Failure, List<AffirmationEntity>>> getAffirmationCategories() {
    return _affirmationCategoryRepository.getAffirmationCategories();
  }
}
