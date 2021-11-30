
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/models/audit_entities_model.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/entities/audit_entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final date = DateTime.parse('2021-10-07T06:25:02');
  final tAuditEntitiesModel = AuditEntitiesModel(auditEntityId: 3273,
      auditId: 89,
      auditEntityName: "City-plus",
      auditEntityTypeId: 932,
      auditParentEntityId: 3257,
      sequenceNo: 42,
      entityEndDate: date,
      isLeafNode: false,
      barcodeNfc: "5152914562",
      entityLevel: 5,
      entityException: true,
      scheduleOccurrenceIds: "5700,5701,5702,5832");
  test(
    'should be a subclass of AuditEntities entity',
        () async {
      // assert
      expect(tAuditEntitiesModel, isA<AuditEntities>());
    },
  );
  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
          () async {
        // arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixture('entity.json'));
        // act
        final result = AuditEntitiesModel.fromJson(jsonMap);
        // assert
        expect(result, tAuditEntitiesModel);
      },
    );

  });
}