import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/add_audit_entities.dart';

class MockAuditEntitiesRepository extends Mock
    implements AuditEntitiesRepository {}

void main() {
  late AddAuditEntities usecase;
  late MockAuditEntitiesRepository mockAuditEntitiesRepository;

  setUp(() {
    mockAuditEntitiesRepository = MockAuditEntitiesRepository();
    usecase = AddAuditEntities(mockAuditEntitiesRepository);
  });

  test(
    'should add AuditEntity from the repository',
        () async {
      // arrange
      when(mockAuditEntitiesRepository.addAuditEntities())
          .thenAnswer((_) async => Right(NoParams()));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(NoParams()));
      verify(mockAuditEntitiesRepository.addAuditEntities());
      verifyNoMoreInteractions(mockAuditEntitiesRepository);
    },
  );
}