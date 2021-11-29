import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/models/audit_entities_model.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/entities/audit_entities.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/repositories/audit_entities_repository.dart';

class AuditEntitiesRepositoryImpl implements AuditEntitiesRepository {
  final AppDatabase appDatabase;

  AuditEntitiesRepositoryImpl({required this.appDatabase});

  Future<Either<Failure, void>?>? AddDta() async {
     try {
       var jsonText = await rootBundle.loadString('assets/entity.json');
       Map<String, dynamic> map = json.decode(jsonText);
       List<dynamic> data = map["auditEntity"];
       List<AuditEntitiesModel> subList = data.map((e) => AuditEntitiesModel.fromJson(e)).toList();
       List<AuditEntityTableCompanion> list = [];

       for (var element in subList) {
         final data = AuditEntityTableCompanion.insert(
           entityException: Value(element.entityException),
           entityEndDate: Value(element.entityEndDate),
           entityLevel: Value(element.entityLevel),
           auditEntityName: Value(element.auditEntityName),
           auditEntityId: Value(element.auditEntityId),
           auditEntityTypeId: Value(element.auditEntityTypeId),
           auditId: Value(element.auditId),
           auditParentEntityId: Value(element.auditParentEntityId),
           barcodeNfc: Value(element.barcodeNfc),
           isLeafNode: Value(element.isLeafNode),
           scheduleOccurrenceIds: Value(element.scheduleOccurrenceIds),
           sequenceNo: Value(element.sequenceNo),
         );
         list.add(data);
       }
       print(list);
       final add = await appDatabase.auditEntityDao
           .insertAuditEntity(list);
       return Right(add);
     } catch (e) {
       return Left(LocalFailure());
     }
   }
  @override
  Future<Either<Failure, void>?>? addAuditEntities() async {
    try {
      var jsonText = await rootBundle.loadString('assets/entity.json');
      Map<String, dynamic> map = json.decode(jsonText);
      List<dynamic> data = map["auditEntity"];
      List<AuditEntitiesModel> subList = data.map((e) => AuditEntitiesModel.fromJson(e)).toList();
      List<AuditEntityTableCompanion> list = [];

      for (var element in subList) {
        final data = AuditEntityTableCompanion.insert(
          entityException: Value(element.entityException),
          entityEndDate: Value(element.entityEndDate),
          entityLevel: Value(element.entityLevel),
          auditEntityName: Value(element.auditEntityName),
          auditEntityId: Value(element.auditEntityId),
          auditEntityTypeId: Value(element.auditEntityTypeId),
          auditId: Value(element.auditId),
          auditParentEntityId: Value(element.auditParentEntityId),
          barcodeNfc: Value(element.barcodeNfc),
          isLeafNode: Value(element.isLeafNode),
          scheduleOccurrenceIds: Value(element.scheduleOccurrenceIds),
          sequenceNo: Value(element.sequenceNo),
        );
        list.add(data);
      }
      print(list);
      final add = await appDatabase.auditEntityDao
          .insertAuditEntity(list);
      return Right(add);
    } catch (e) {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>?>? deleteAuditEntities(
      AuditEntity auditEntities) async {
    final delete = await appDatabase.auditEntityDao
        .deleteAuditEntity(auditEntities as Insertable<AuditEntity>);
    return Right(delete);
  }

  @override
  Future<Either<Failure, List<AuditEntity>>?>? getAuditEntities() async {
    try{
      final get = await appDatabase.auditEntityDao.watchAllAuditEntity();
      return Right(get);
    }on Exception{
      return Left(LocalFailure());
    }

  }

  @override
  Future<Either<Failure, void>?>? updateAuditEntities(
      AuditEntity auditEntities) async {
    final update = await appDatabase.auditEntityDao
        .updateAuditEntity(auditEntities as Insertable<AuditEntity>);
    return Right(update);
  }

}

