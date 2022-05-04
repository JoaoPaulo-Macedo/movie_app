import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class AssetsDataSource {
  Future<List<ListEntity>> getLists();
}
