import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infraestructure/datasources/moviedb_datasource.dart';
import 'package:movies_app/infraestructure/repositories/moviedb_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) => MovieDBRepositoryImpl(MovieDBDatasource()));