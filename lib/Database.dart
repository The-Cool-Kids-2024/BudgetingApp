import 'dart:io';
import 'package:postgres/postgres.dart';
import 'package:crypto/crypto.dart';

class Database {
  static late Connection conn;

  static void init() async {
    conn = await Connection.open(
      Endpoint(
        host: '74.136.171.60',
        database: 'postgres',
        username: 'aquacleanpro',
        password: 'buck',
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );

    print('Database initialzied');
  }
}
