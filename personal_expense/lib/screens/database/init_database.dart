import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';
import 'sql_scripts.dart';
import 'package:path/path.dart';


class InitDatabase {
  List<String> initialScript = [
    SqlScripts.createUserInfoTable,
  ];

  /// Add SQL Query into the list for database changes
  List<String> migrationScript = [
    // SqlScripts.createPaymentMethodInfoTable,
  ];

  Future<Database> open() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'msdsl_restaurant_pos.db');

    final config = MigrationConfig(
        initializationScript: initialScript, migrationScripts: migrationScript);

    return await openDatabaseWithMigration(path, config);
  }
}
