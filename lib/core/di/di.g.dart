// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'di.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => NetworkService())
      ..registerFactory((c) => AffirmationCategoryDataSource())
      ..registerFactory<AffirmationCategoryRepository>((c) =>
          AffirmationCategoryRepositoryImpl(c<AffirmationCategoryDataSource>()))
      ..registerFactory(
          (c) => AffirmationCategoryUseCase(c<AffirmationCategoryRepository>()))
      ..registerFactory((c) => HomeBloc(c<AffirmationCategoryUseCase>()));
  }
}
