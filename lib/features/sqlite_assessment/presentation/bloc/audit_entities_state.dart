part of 'audit_entities_bloc.dart';

abstract class AuditEntitiesState extends Equatable {
  const AuditEntitiesState();
}

class Empty extends AuditEntitiesState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends AuditEntitiesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loaded extends AuditEntitiesState {
  final List<AuditEntity?>? auditEntitiesList;

  const Loaded({required this.auditEntitiesList});

  @override
  List<Object> get props => [auditEntitiesList!];
}

class Error extends AuditEntitiesState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
