import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/data/services/dio_service_imp.dart';
import 'package:movie_app/data/repositories/lists_repository_imp.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/usecases/get_lists_usecase_imp.dart';
import 'package:movie_app/external/datasource/local/lists_datasource_imp.dart';

void main() {
  test('Test if 15 lists came from API', () async {
    var useCase = GetAllListsUseCaseImp(
      ListsRepositoryImp(
        ListsDataSourceImp(
          DioHttpServiceImp(),
        ),
      ),
    );

    List<ListIdentifierEntity> lists = await useCase();

    expect(15, lists.length);
    expect(lists, 'lists');
  });
}
