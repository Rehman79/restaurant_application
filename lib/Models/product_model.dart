
import 'Review_model.dart';

class Product {
  final String name;
  final String ingredients;
  final String category;
  final String imagePath;
  final double price;
  final String description;
  final List<Review> reviews;

  Product({
    required this.name,
    required this.ingredients,
    required this.category,
    required this.imagePath,
    required this.price,
    required this.description,
    this.reviews = const [],
  });

  // Calculate the average rating from reviews
  double get averageRating {
    if (reviews.isEmpty) {
      return 0.0;
    }
    double totalRating = reviews.fold(0.0, (sum, review) => sum + review.rating);
    return totalRating / reviews.length;
  }
}
