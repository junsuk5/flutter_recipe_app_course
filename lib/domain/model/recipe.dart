// Recipe model class
import 'recipe_ingredient.dart';

class Recipe {
  final String category;
  final int id;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      category: json['category'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      chef: json['chef'] as String,
      time: json['time'] as String,
      rating: json['rating'].toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'id': id,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe(category: $category, id: $id, name: $name, chef: $chef, '
        'time: $time, rating: $rating, ingredients: $ingredients)';
  }
}



