import 'package:postgres/postgres.dart';

class Database {
  static late Connection conn;

  static void init() async {
    conn = await Connection.open(
      Endpoint(
        host: 'aquacleanpro.org',
        database: 'postgres',
        username: 'aquacleanpro',
        password: 'buck',
      ),
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    print('Database initialzied');
  }
}
