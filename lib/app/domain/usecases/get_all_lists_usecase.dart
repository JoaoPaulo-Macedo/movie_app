import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/app/data/dtos/list_dto.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/core/utils/debug.dart';

abstract class GetAllListsUseCase {
  Future<List<ListEntity>> call();
}

class GetAllListsUseCaseImp extends GetAllListsUseCase {
  GetAllListsUseCaseImp(this._repository);

  final ListRepository _repository;

  @override
  Future<List<ListEntity>> call() async {
    const amount = 10;

    return await _repository.getManyLists(amount);

    //TODO: Remove Mocked data
    // List<ListEntity> list = [];
    // List jsonList = jsonDecode(await rootBundle.loadString('assets/lists.json'));
    // Debug.log(
    //   jsonList.toString(),
    //   description: 'Lists from assets to avoid API overload',
    //   debugSource: DebugSource.mock,
    // );
    // for (var json in jsonList) {
    //   list.add(ListDTO.fromJson(json));
    // }

    // return list;
  }
}
