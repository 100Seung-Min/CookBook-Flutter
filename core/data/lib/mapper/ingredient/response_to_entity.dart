import 'package:domain/entity/ingredient_entity.dart';
import 'package:remote/response/ingredient/ingredient_response.dart';

extension IngredientResponseToEntityX on IngredientResponse {
  IngredientEntity toEntity() => IngredientEntity(
    ingredient: ingredient,
    capacity: capacity,
    type: type,
  );
}