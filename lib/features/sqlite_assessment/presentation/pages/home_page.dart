import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/bloc/audit_entities_bloc.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/widgets/audit_entity_display.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/widgets/loading_widget.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/widgets/message_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Audit Entities'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildState(context)),
          ],
        ));
  }

  Widget _addDataFromJson(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      highlightColor: Colors.black54,
      onPressed: () => _onAddAuditEntity(context),
    );
  }

  void _onAddAuditEntity(BuildContext context) {
    BlocProvider.of<AuditEntitiesBloc>(context)
        .add(const AddAuditEntityEvent());
  }
}

Widget _buildState(BuildContext context) {
  return BlocBuilder<AuditEntitiesBloc, AuditEntitiesState>(
    builder: (context, state) {
      if (state is Empty) {
        return const MessageDisplay(
          message: 'Start now!',
        );
      } else if (state is Loading) {
        return const LoadingWidget();
      } else if (state is Loaded) {
        return AuditEntityDisplay(
          auditEntitiesList: state.auditEntitiesList!,
        );
      } else if (state is Error) {
        return MessageDisplay(
          message: state.message,
        );
      }
      return Container();
    },
  );
}
