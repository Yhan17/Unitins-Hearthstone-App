import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static late String clientId;
  static late String clientSecret;
  static late String apiUrl;
  static late String authUrl;

  static Future<void> init({String fileName = '.env'}) async {
    await dotenv.load(fileName: fileName);

    clientId = dotenv.env['clientID']!;
    clientSecret = dotenv.env['clientSecret']!;
    apiUrl = dotenv.env['apiUrl']!;
    authUrl = dotenv.env['authUrl']!;
  }
}
