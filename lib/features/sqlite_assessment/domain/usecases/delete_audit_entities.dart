

import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';

class DeleteAuditEntities extends UseCase<void, AuditEntity> {
  final AuditEntitiesRepository repository;

  DeleteAuditEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(AuditEntity params) async {
    return await repository.deleteAuditEntities(params);
  }
}
