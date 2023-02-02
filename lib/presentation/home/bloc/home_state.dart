import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';

abstract class HomeState {}

class LoadingAffirmationState extends HomeState {}

class LoadedAffirmationState extends HomeState {
  final List<AffirmationEntity> affirmationList;
  LoadedAffirmationState(this.affirmationList);
}

class ErrorAffirmationState extends HomeState {}
