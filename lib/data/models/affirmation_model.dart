import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';

class AffirmationModel extends AffirmationEntity {
  AffirmationModel({
    required String category,
    required List<String> affirmation,
    required String image,
  }) : super(
          affirmation: affirmation,
          category: category,
          image: image,
        );

  factory AffirmationModel.fromJson(Map<String, dynamic> json) =>
      AffirmationModel(
        image: json['image'],
        category: json["category"],
        affirmation: List<String>.from(json["affirmation"].map((x) => x)),
      );
}
