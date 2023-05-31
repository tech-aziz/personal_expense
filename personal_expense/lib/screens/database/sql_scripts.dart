import 'database_info.dart';

class SqlScripts {
  static const String createUserInfoTable =
      'CREATE TABLE ${DatabaseInfo.userInfo} '
      '(${DatabaseInfo.columnUserId} INTEGER PRIMARY KEY AUTOINCREMENT,'
      '${DatabaseInfo.columnUserName} TEXT,'
      '${DatabaseInfo.columnUserEmail} TEXT UNIQUE,'
      '${DatabaseInfo.columnUserPassword} TEXT)';
}
