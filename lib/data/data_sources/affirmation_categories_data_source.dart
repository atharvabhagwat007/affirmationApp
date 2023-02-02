import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dailyAffirmationss/affirmations_data.dart';
import 'package:dailyAffirmationss/core/networking/failure.dart';
import 'package:dailyAffirmationss/data/models/affirmation_model.dart';
import 'package:dartz/dartz.dart';

class AffirmationCategoryDataSource {
  Future<Either<Failure, List<AffirmationModel>>>
      getAffirmationCategories() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection('affirmations').get();
      List data = response.docs[0].data()['data'];
      List<AffirmationModel> affirmationList =
          data.map((e) => AffirmationModel.fromJson(e)).toList();

      return Right(affirmationList);
    } on FirebaseException catch (e) {
      return Left(Failure(int.parse(e.code), e.message.toString()));
    }
  }

  addAffirmations() async {
    await FirebaseFirestore.instance
        .collection('affirmations')
        .add(AffirmationData.affirmations)
        .then((value) => print("done"));
  }
}
