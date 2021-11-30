



import 'package:sqlite_assessment/features/sqlite_assessment/domain/entities/audit_entities.dart';

class AuditEntitiesModel extends AuditEntities {
   const AuditEntitiesModel({
    required int auditEntityId,
    required int auditId,
    required String auditEntityName,
    required int auditEntityTypeId,
    required int auditParentEntityId,
    required int sequenceNo,
    required DateTime entityEndDate,
    required bool isLeafNode,
    required String barcodeNfc,
    required int entityLevel,
    required bool entityException,
    required String scheduleOccurrenceIds,
  }) : super(
       auditEntityId: auditEntityId,
          auditId: auditId,
          auditEntityName: auditEntityName,
          auditEntityTypeId: auditEntityTypeId,
          auditParentEntityId: auditParentEntityId,
          sequenceNo: sequenceNo,
          entityEndDate: entityEndDate,
          isLeafNode: isLeafNode,
          barcodeNfc: barcodeNfc,
          entityLevel: entityLevel,
          entityException: entityException,
          scheduleOccurrenceIds: scheduleOccurrenceIds
        );

  factory AuditEntitiesModel.fromJson(Map<String, dynamic> json) => AuditEntitiesModel(
    auditEntityId: json["AuditEntityId"],
    auditId: json["AuditId"],
    auditEntityName: json["AuditEntityName"],
    auditEntityTypeId: json["AuditEntityTypeId"],
    auditParentEntityId: json["AuditParentEntityId"],
    sequenceNo: json["SequenceNo"],
    entityEndDate: json["EntityEndDate"] == null ? DateTime.now() : DateTime.parse(json["EntityEndDate"]),
    isLeafNode: json["IsLeafNode"] ?? false,
    barcodeNfc: json["BarcodeNFC"] ?? "",
    entityLevel: json["EntityLevel"] ?? 0,
    entityException: json["EntityException"] ?? false,
    scheduleOccurrenceIds: json["ScheduleOccurrenceIds"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "AuditEntityId": auditEntityId,
    "AuditId": auditId,
    "AuditEntityName": auditEntityName,
    "AuditEntityTypeId": auditEntityTypeId,
    "AuditParentEntityId": auditParentEntityId,
    "SequenceNo": sequenceNo,
    "EntityEndDate": entityEndDate ?? DateTime.now(),
    "IsLeafNode": isLeafNode,
    "BarcodeNFC": barcodeNfc ?? "",
    "EntityLevel": entityLevel,
    "EntityException": entityException ?? "",
    "ScheduleOccurrenceIds": scheduleOccurrenceIds ?? "",
  };

}
