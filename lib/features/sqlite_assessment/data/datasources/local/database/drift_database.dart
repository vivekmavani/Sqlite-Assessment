import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/daos/audit_entity_dao.dart';

part 'drift_database.g.dart';

@DataClassName('AuditEntity')
class AuditEntityTable extends Table {
  IntColumn get auditEntityId => integer().nullable()();

  IntColumn get auditId => integer().nullable()();

  IntColumn get auditEntityTypeId => integer().nullable()();

  IntColumn get auditParentEntityId => integer().nullable()();

  IntColumn get sequenceNo => integer().nullable()();

  IntColumn get entityLevel => integer().nullable()();

  BoolColumn get isLeafNode => boolean().nullable()();

  BoolColumn get entityException => boolean().nullable()();

  TextColumn get auditEntityName =>
      text().nullable()();

  TextColumn get barcodeNfc =>
      text().nullable()();

  TextColumn get scheduleOccurrenceIds =>
      text().nullable()();

  DateTimeColumn get entityEndDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {auditEntityId};


}

@DriftDatabase(tables: [AuditEntityTable], daos: [AuditEntityDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e)
      : super(e);

  @override
  int get schemaVersion => 1;

}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

