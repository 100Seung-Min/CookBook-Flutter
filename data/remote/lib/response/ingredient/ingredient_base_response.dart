import 'package:json_annotation/json_annotation.dart';

import '../base_response.dart';

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
