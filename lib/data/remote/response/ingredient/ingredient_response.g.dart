// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientResponse _$IngredientResponseFromJson(Map<String, dynamic> json) =>
    IngredientResponse(
      json['IRDNT_NM'] as String,
      json['IRDNT_CPCTY'] as String,
      json['IRDNT_TY_NM'] as String,
    );

Map<String, dynamic> _$IngredientResponseToJson(IngredientResponse instance) =>
    <String, dynamic>{
      'IRDNT_NM': instance.ingredient,
      'IRDNT_CPCTY': instance.capacity,
      'IRDNT_TY_NM': instance.type,
    };
