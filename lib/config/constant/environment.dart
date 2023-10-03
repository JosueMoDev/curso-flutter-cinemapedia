import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static  String  theMovieDBApiKey = dotenv.env['THE_MOVIEDB_API_KEY'] ?? 'NO API KEY';
  static  String  apiBaseUrl = dotenv.env['API_BASE_URL'] ?? 'NO BASE URL';
  static  String  imageServer = dotenv.env['IMAGE_SERVER'] ?? 'NO IMAGE SERVER';
}