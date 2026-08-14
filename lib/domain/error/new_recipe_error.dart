import '../../core/domain/error/error.dart';

enum NewRecipeError implements Error {
  noRecipe,
  invalidCategory,
  unknown;
}
