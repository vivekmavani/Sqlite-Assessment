part of 'audit_entities_bloc.dart';

abstract class AuditEntitiesEvent extends Equatable {
  final AuditEntity? auditEntities;
  const AuditEntitiesEvent({this.auditEntities});
  @override
  List<Object> get props => [auditEntities!];
}

class GetAllAuditEntityEvent extends AuditEntitiesEvent {
  const GetAllAuditEntityEvent();
}

class DeleteAuditEntityEvent extends AuditEntitiesEvent {
  const DeleteAuditEntityEvent(AuditEntity auditEntities) : super(auditEntities: auditEntities);
}

class AddAuditEntityEvent extends AuditEntitiesEvent {
  const AddAuditEntityEvent() : super();
}

class UpdateAuditEntityEvent extends AuditEntitiesEvent {
  const UpdateAuditEntityEvent(AuditEntity auditEntities) : super(auditEntities: auditEntities);
}
