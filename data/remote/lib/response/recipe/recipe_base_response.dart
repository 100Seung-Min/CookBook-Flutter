import 'package:json_annotation/json_annotation.dart';

import '../base_response.dart';

part 'recipe_base_response.g.dart';

@JsonSerializable()
class RecipeBaseResponse {
  RecipeBaseResponse(
    this.response,
  );

  factory RecipeBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeBaseResponseToJson(this);

  @JsonKey(name: 'Grid_20150827000000000228_1')
  final BaseResponse response;
}
