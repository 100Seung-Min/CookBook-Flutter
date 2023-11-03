// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) => FoodResponse(
      json['RECIPE_ID'] as int,
      json['RECIPE_NM_KO'] as String,
      json['SUMRY'] as String,
      json['COOKING_TIME'] as String,
      json['CALORIE'] as String,
      json['LEVEL_NM'] as String,
    );

Map<String, dynamic> _$FoodResponseToJson(FoodResponse instance) =>
    <String, dynamic>{
      'RECIPE_ID': instance.recipeId,
      'RECIPE_NM_KO': instance.recipeName,
      'SUMRY': instance.summary,
      'COOKING_TIME': instance.cookingTime,
      'CALORIE': instance.calorie,
      'LEVEL_NM': instance.level,
    };
