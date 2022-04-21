import 'dart:convert';

import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetailsLocalDataSource {
  final _key = 'account_details';

  saveDetails(AccountDetailsEntity details) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(details.toJson()));
  }

  Future<AccountDetailsEntity?>? getDetails() async {
    var prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_key);

    if (jsonString == null) return null;

    return AccountDetailsDTO.fromJson(jsonDecode(jsonString));
  }
}
