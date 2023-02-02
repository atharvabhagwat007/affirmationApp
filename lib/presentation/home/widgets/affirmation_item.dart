import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyAffirmationss/domain/entities/affirmation_entity.dart';
import 'package:flutter/material.dart';

class AffirmationItem extends StatelessWidget {
  const AffirmationItem({
    super.key,
    required this.affimation,
  });

  final AffirmationEntity affimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            _image(),
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            affimation.category,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: double.infinity,
        child: CachedNetworkImage(
          imageUrl: affimation.image,
          filterQuality: FilterQuality.low,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
