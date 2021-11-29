import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sqlite_assessment/core/error/failures.dart';
import 'package:sqlite_assessment/core/usecases/usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/add_audit_entities.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/delete_audit_entities.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/get_audit_entities_usecase.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/domain/usecases/update_audit_entities.dart';

part 'audit_entities_event.dart';

part 'audit_entities_state.dart';
const String Local_FAILURE_MESSAGE = 'Local Failure';
class AuditEntitiesBloc extends Bloc<AuditEntitiesEvent, AuditEntitiesState> {
  final GetAuditEntities getAuditEntities;
  final AddAuditEntities addAuditEntities;
  final DeleteAuditEntities deleteAuditEntities;
  final UpdateAuditEntities updateAuditEntities;

  AuditEntitiesBloc(this.getAuditEntities, this.updateAuditEntities,
      this.deleteAuditEntities, this.addAuditEntities)
      : super(Empty());

  @override
  Stream<AuditEntitiesState> mapEventToState(
    AuditEntitiesEvent event,
  ) async* {
    if (event is GetAllAuditEntityEvent) {
      yield* _getAllSavedArticles();
    }
    if (event is DeleteAuditEntityEvent) {
      await deleteAuditEntities(event.auditEntities!);
      yield* _getAllSavedArticles();
    }
    if (event is AddAuditEntityEvent) {
      await addAuditEntities(NoParams());
      yield* _getAllSavedArticles();
    }
    if (event is UpdateAuditEntityEvent) {
      await updateAuditEntities(event.auditEntities!);
      yield* _getAllSavedArticles();
    }
  }
  Stream<AuditEntitiesState> _getAllSavedArticles() async* {
    yield Loading();
    final getAuditEntitiesList = await getAuditEntities(NoParams());
    yield* _eitherLoadedOrErrorState(getAuditEntitiesList);
  }

  Stream<AuditEntitiesState> _eitherLoadedOrErrorState(
      Either<Failure, List<AuditEntity?>?>? either,
      ) async* {
    if(either != null)
    {
      yield either.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (list) => Loaded(auditEntitiesList: list),
      );
    }
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case LocalFailure:
        return Local_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
