import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  final List<String> reviews;

  ReviewsTab({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: reviews.map((review) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(review),
      )).toList(),
    );
  }
}
