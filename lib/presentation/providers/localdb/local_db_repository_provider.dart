import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infraestructure/datasources/isar_local_db_datasource_impl.dart';
import 'package:movies_app/infraestructure/repositories/isar_local_db_repository_impl.dart';

final localDBRepositoryProvider = Provider((ref) {
  return IsarLocalDBRepositoryImpl(IsarLocalDBDatasourceImpl());
});
