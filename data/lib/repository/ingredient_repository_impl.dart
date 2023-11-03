import 'package:data/mapper/ingredient/response_to_entity.dart';
import 'package:domain/entity/ingredient_entity.dart';
import 'package:domain/repository/ingredient_repository.dart';
import 'package:remote/datasource/ingredient_remote_source.dart';

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
