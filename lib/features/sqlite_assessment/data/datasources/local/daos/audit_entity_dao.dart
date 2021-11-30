

import 'package:drift/drift.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';

part 'audit_entity_dao.g.dart';

@DriftAccessor(tables: [AuditEntityTable])
class AuditEntityDao extends DatabaseAccessor<AppDatabase>
    with _$AuditEntityDaoMixin {
  final AppDatabase db;

  AuditEntityDao(this.db) : super(db);

  Future<List<AuditEntity>> watchAllAuditEntity() => select(auditEntityTable).get();

  Future<void> insertAuditEntity(List<AuditEntityTableCompanion> auditEntities) async{
    await batch((batch) {
      batch.insertAll(auditEntityTable, auditEntities);
    });
  }

  Future updateAuditEntity(Insertable<AuditEntity> auditEntities) =>
      update(auditEntityTable).replace(auditEntities);

  Future deleteAuditEntity(Insertable<AuditEntity> auditEntities) =>
      delete(auditEntityTable).delete(auditEntities);
}
