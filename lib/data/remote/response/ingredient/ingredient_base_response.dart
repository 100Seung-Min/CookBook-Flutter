import 'package:cookbook/data/remote/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_base_response.g.dart';

@JsonSerializable()
class IngredientBaseResponse {
  IngredientBaseResponse(this.response);

  factory IngredientBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientBaseResponseToJson(this);

  @JsonKey(name: 'Grid_20150827000000000227_1')
  final BaseResponse response;
}
