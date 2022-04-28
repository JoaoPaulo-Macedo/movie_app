import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/core/utils/debug.dart';

abstract class GetAllListsUseCase {
  call();
}

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._repository);

  final ListsRepository _repository;

  @override
  Future<List<ListIdentifierEntity>> call() async {
    // const amount = 10;

    // return await _repository(amount);

    //TODO: Remove Mocked data
    List<ListIdentifierEntity> list = [];
    List jsonList = jsonDecode(await rootBundle.loadString('assets/lists.json'));
    Debug.log(
      jsonList.toString(),
      description: 'Lists from assets to avoid API overload',
      debugSource: DebugSource.mock,
    );
    for (var json in jsonList) {
      list.add(ListIdentifierDTO.fromJson(json));
    }

    return list;
  }
}
