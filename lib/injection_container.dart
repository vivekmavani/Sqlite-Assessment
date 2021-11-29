import 'package:get_it/get_it.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/bloc/audit_entities_bloc.dart';

import 'features/sqlite_assessment/data/datasources/local/daos/audit_entity_dao.dart';
import 'features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'features/sqlite_assessment/data/repositories/audit_entities_repository_impl.dart';
import 'features/sqlite_assessment/domain/usecases/add_audit_entities.dart';
import 'features/sqlite_assessment/domain/usecases/delete_audit_entities.dart';
import 'features/sqlite_assessment/domain/usecases/get_audit_entities_usecase.dart';
import 'features/sqlite_assessment/domain/usecases/update_audit_entities.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AuditEntitiesBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(() => GetAuditEntities(sl()));
  sl.registerLazySingleton(() => AddAuditEntities(sl()));
  sl.registerLazySingleton(() => DeleteAuditEntities(sl()));
  sl.registerLazySingleton(() => UpdateAuditEntities(sl()));

// Repository
  sl.registerLazySingleton<AuditEntitiesRepository>(
    () => AuditEntitiesRepositoryImpl(appDatabase: sl()),
  );
  sl.registerSingleton(AppDatabase(openConnection()));
  // Dio client
  sl.registerSingleton<AuditEntityDao>(AuditEntityDao(sl()));


}
