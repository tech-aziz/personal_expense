import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../database/database_info.dart';
import '../../../database/init_database.dart';
import '../../../models/base_response.dart';

class SignupRepository {
  Database? _database;

  SetupRepository() {
    _initDatabase();
  }

  void _initDatabase() async {
    _database = await InitDatabase().open();
  }

  //Create SignUp
  createSignup(
    String name,
    String email,
    String password,
  ) async {
    if (_database == null || !_database!.isOpen) {
      _database = await InitDatabase().open();
    }

    try {
      var query = 'INSERT INTO ${DatabaseInfo.userInfo}'
          '(${DatabaseInfo.columnUserName}, ${DatabaseInfo.columnUserEmail}, '
          '${DatabaseInfo.columnUserPassword})'
          'VALUES (?, ?, ?);';
      var values = [name, email, password];

      final int id = await _database!.rawInsert(query, values);

      if (id > 0) {
        print("Account created $id");
        return BaseResponse(true, 'Account Created', null);
      } else {
        print("Account not created");
        return BaseResponse(false, 'Could Not Account', null);
      }
    } catch (exception) {
      debugPrint(exception.toString());
      BaseResponse(false, 'Database Exception', null);
    }
  }
}
