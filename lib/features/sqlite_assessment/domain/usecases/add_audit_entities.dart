
import 'package:dartz/dartz.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';

class AddAuditEntities extends UseCase<void, NoParams> {
  final AuditEntitiesRepository repository;

  AddAuditEntities(this.repository);

  @override
  Future<Either<Failure, void>?>? call(NoParams params) async {
    return await repository.addAuditEntities();
  }
}
