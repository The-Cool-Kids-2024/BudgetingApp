import 'package:postgres/postgres.dart';

class Database {
  static late Connection conn;

  static void init() async {
    conn = await Connection.open(
      Endpoint(
        host: '192.168.1.100',
        database: 'postgres',
        username: 'aquacleanpro',
        password: 'buck',
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    print('Database initialzied');
  }
}
