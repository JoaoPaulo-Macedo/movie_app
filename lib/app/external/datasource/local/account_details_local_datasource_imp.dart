import 'dart:convert';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class AccountDetailsLocalDataSource {
  AccountDetailsLocalDataSource(this._service);

  final LocalDataService _service;

  final _key = 'account_details';

  Future<bool> saveDetails(AccountDetailsEntity details) async {
    return await _service.setString(
      _key,
      jsonEncode(details.toJson()),
      description: 'Set account details in cache',
    );
  }

  Future<AccountDetailsEntity?> getDetails() async {
    String? jsonString = await _service.getString(
      _key,
      description: 'Get account details from cache',
    );

    if (jsonString == null) return null;

    return AccountDetailsDTO.fromJson(jsonDecode(jsonString));
  }
}
