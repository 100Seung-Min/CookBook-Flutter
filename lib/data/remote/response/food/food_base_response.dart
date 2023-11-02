import 'package:cookbook/data/remote/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_base_response.g.dart';

@JsonSerializable()
class FoodBaseResponse {
  FoodBaseResponse(
    this.response,
  );

  factory FoodBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodBaseResponseToJson(this);

  @JsonKey(name: 'Grid_20150827000000000226_1')
  final BaseResponse response;
}
