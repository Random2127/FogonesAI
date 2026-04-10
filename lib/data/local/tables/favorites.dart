import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/tables/recipes.dart';
import 'package:fogonesia/data/local/tables/users.dart';

/// `favorites` — see root [DATABASE SCHEMA.md] (FAVORITES).
///
/// UNIQUE(`user_id`, `recipe_id`) via [uniqueKeys].
@DataClassName('FavoriteRow')
class Favorites extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().references(Users, #id)();

  TextColumn get recipeId => text().references(Recipes, #id)();

  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {userId, recipeId},
      ];

  @override
  String get tableName => 'favorites';
}
