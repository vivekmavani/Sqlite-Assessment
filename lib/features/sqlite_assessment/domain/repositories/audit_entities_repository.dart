import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
abstract class AuditEntitiesRepository {
  Future<Either<Failure, List<AuditEntity?>>?>? getAuditEntities();
  Future<Either<Failure, void>?>? updateAuditEntities(AuditEntity auditEntities);
  Future<Either<Failure, void>?>? addAuditEntities();
  Future<Either<Failure, void>?>? deleteAuditEntities(AuditEntity auditEntities);
}
