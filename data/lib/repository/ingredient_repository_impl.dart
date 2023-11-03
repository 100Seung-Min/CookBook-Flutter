import 'package:data/remote/response/ingredient/ingredient_response.dart';
import 'package:domain/entity/ingredient_entity.dart';
import 'package:domain/repository/ingredient_repository.dart';

import '../remote/datasource/ingredient_remote_source.dart';

class IngredientRepositoryImpl extends IngredientRepository {
  IngredientRepositoryImpl(this.ingredientRemoteSource);

  final IngredientRemoteSource ingredientRemoteSource;

  @override
  Future<List<IngredientEntity>> getIngredient({required int recipeId}) async {
    final response =
        await ingredientRemoteSource.getIngredient(recipeId: recipeId);
    return response.map((item) => item.toEntity()).toList();
  }
}
