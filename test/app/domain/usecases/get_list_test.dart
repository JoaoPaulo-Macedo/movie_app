import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/app/data/repositories/list_repository_imp.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/external/datasource/local/assets_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/movies_list_datasource_imp.dart';

import '../../../mockito.mocks.dart';

void main() {
  test('Get one list', () async {
    var dioMock = MockDioHttpServiceImp();

    var usecase = GetListUseCaseImp(
      ListRepositoryImp(
        MoviesListDataSourceImp(dioMock),
        AssetsDataSourceImp(),
      ),
    );

    int listId = 1;
    int page = 1;

    when(
      dioMock.get(any, description: anyNamed('description')),
    ).thenAnswer((_) async {
      return Response(data: jsonDecode(jsonData), requestOptions: RequestOptions(path: ''));
    });

    ListEntity? list = await usecase(list: listId, page: page);

    expect(list!.id, listId);
  });
}

String jsonData = '''
  {
    "id": 1,
    "name": "The Marvel Universe",
    "page": 1,
    "poster_path": "coJVIUEOToAEGViuhclM7pXC75R.jpg",
    "total_results": 59,
    "user_name": "Travis Bell",
    "average_rating": 6.04565
  }
''';

// Future<String> jsonData() async {
//   var json = await rootBundle.loadString('assets/list.json');

//   return json;
// }
