import 'package:dailyAffirmationss/core/networking/failure.dart';
import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AffirmationCategoryRepository {
  Future<Either<Failure, List<AffirmationEntity>>> getAffirmationCategories();
}
