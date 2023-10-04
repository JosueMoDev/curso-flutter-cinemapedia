import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infraestructure/datasources/actordb_datasource.dart';
import 'package:movies_app/infraestructure/repositories/actorsdb_respository_impl.dart';

final actorListRepositoryProvider = Provider((ref) => ActorsDBRepositoryIml(ActorsDBDataSource()));
