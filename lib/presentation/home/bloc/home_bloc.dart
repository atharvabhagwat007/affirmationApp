import 'package:dailyAffirmationss/domain/use_cases/affiramtion_category_usecase.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_event.dart';
import 'package:dailyAffirmationss/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AffirmationCategoryUseCase _affirmationCategoryUseCase;
  HomeBloc(this._affirmationCategoryUseCase)
      : super(LoadingAffirmationState()) {
    on<LoadingAffirmationEvent>(_loadAffirmations);
  }

  void _loadAffirmations(LoadingAffirmationEvent event, Emitter emit) async {
    final response =
        await _affirmationCategoryUseCase.getAffirmationCategories();
    response.fold(
      (l) => emit(ErrorAffirmationState()),
      (r) => emit(LoadedAffirmationState(r)),
    );
  }
}
