import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/delete_audit_entities.dart';

class MockAuditEntitiesRepository extends Mock
    implements AuditEntitiesRepository {}

void main() {
  late DeleteAuditEntities usecase;
  late MockAuditEntitiesRepository mockAuditEntitiesRepository;

  setUp(() {
    mockAuditEntitiesRepository = MockAuditEntitiesRepository();
    usecase = DeleteAuditEntities(mockAuditEntitiesRepository);
  });

  final  auditEntity= AuditEntity(auditParentEntityId: 1,auditEntityName: 'Gujarat');

  test(
    'should delete AuditEntity from the repository',
        () async {
      // arrange
      when(mockAuditEntitiesRepository.deleteAuditEntities(auditEntity))
          .thenAnswer((_) async => Right(auditEntity));
      // act
      final result = await usecase(auditEntity);
      // assert
      expect(result, Right(auditEntity));
      verify(mockAuditEntitiesRepository.deleteAuditEntities(auditEntity));
      verifyNoMoreInteractions(mockAuditEntitiesRepository);
    },
  );
}