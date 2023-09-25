import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  
  static  String theMovieDBApiKey = dotenv.env['THE_MOVIEDB_API_KEY'] ?? 'NO API KEY';
}