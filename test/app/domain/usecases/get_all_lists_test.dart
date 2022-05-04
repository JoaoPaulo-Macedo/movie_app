import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/core/utils/app_configs.dart';

void main() {
  Inject.init();
  AppConfigs(AppEnvironment.prod);
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Get all lists', () async {
    var usecase = GetIt.instance.get<GetAllListsUseCase>();

    List<ListEntity?> lists = await usecase();

    expect(lists.length, 10);
  });
}
