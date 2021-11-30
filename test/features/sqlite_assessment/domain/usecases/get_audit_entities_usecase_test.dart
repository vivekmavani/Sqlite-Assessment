import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/get_audit_entities_usecase.dart';
class MockAuditEntitiesRepository extends Mock
    implements AuditEntitiesRepository {}

void main() {
  late GetAuditEntities usecase;
  late MockAuditEntitiesRepository mockAuditEntitiesRepository;

  setUp(() {
    mockAuditEntitiesRepository = MockAuditEntitiesRepository();
    usecase = GetAuditEntities(mockAuditEntitiesRepository);
  });

  final List<AuditEntity> tAuditEntity= [AuditEntity(auditParentEntityId: 1,auditEntityName: 'Gujarat'),AuditEntity(auditParentEntityId: 2,auditEntityName: 'Rajkot')];

  test(
    'should get AuditEntities from the repository',
        () async {
      // arrange
      when(mockAuditEntitiesRepository.getAuditEntities())
          .thenAnswer((_) async => Right(tAuditEntity));
      // act
      // Since random number doesn't require any parameters, we pass in NoParams.
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tAuditEntity));
      verify(mockAuditEntitiesRepository.getAuditEntities());
      verifyNoMoreInteractions(mockAuditEntitiesRepository);
    },
  );
}