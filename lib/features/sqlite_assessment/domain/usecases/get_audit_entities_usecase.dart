import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/entities/audit_entities.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';

class GetAuditEntities extends UseCase<List<AuditEntity?>, NoParams> {
  final AuditEntitiesRepository repository;

  GetAuditEntities(this.repository);

  @override
  Future<Either<Failure, List<AuditEntity?>>?>? call(NoParams params) async {
    return await repository.getAuditEntities();
  }
}
