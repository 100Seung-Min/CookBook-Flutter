import 'package:domain/entity/ingredient_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_response.g.dart';

@JsonSerializable()
class IngredientResponse {
  IngredientResponse(this.ingredient, this.capacity, this.type);

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientResponseToJson(this);

  @JsonKey(name: 'IRDNT_NM')
  final String ingredient;
  @JsonKey(name: 'IRDNT_CPCTY')
  final String capacity;
  @JsonKey(name: 'IRDNT_TY_NM')
  final String type;
}

extension IngredientResponseToEntityX on IngredientResponse {
  IngredientEntity toEntity() => IngredientEntity(
        ingredient: ingredient,
        capacity: capacity,
        type: type,
      );
}
