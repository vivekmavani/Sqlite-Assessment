import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/data/datasources/local/database/drift_database.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/bloc/audit_entities_bloc.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/widgets/show_alert_dialog.dart';

import 'message_display.dart';

class AuditEntityDisplay extends StatefulWidget {
  const AuditEntityDisplay({required this.auditEntitiesList, Key? key}) : super(key: key);
  final List<AuditEntity?> auditEntitiesList;

  @override
  State<AuditEntityDisplay> createState() => _AuditEntityDisplayState();
}

class _AuditEntityDisplayState extends State<AuditEntityDisplay> {
  @override
  Widget build(BuildContext context) {
    if (widget.auditEntitiesList.isEmpty) {
      _onAddAuditEntity(context);
    }
    return ListView.builder(
      itemCount: widget.auditEntitiesList.length,
      itemBuilder: (_, index) {
        final itemAuditEntity = widget.auditEntitiesList[index];
        return _buildListItem(context,itemAuditEntity);
      },
    );
  }

  Widget _buildListItem(BuildContext context,AuditEntity? auditEntities) {
    return Card(
      elevation: 2.0,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              label: 'Edit',
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              onPressed: (_) => _onEditAuditEntity(context,auditEntities),
            ),
            SlidableAction(
              label: 'Delete',
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (_) => _onDeleteAuditEntity(context,auditEntities),
            ),
          ],
        ),
        child: ListTile(
          title: Text(auditEntities!.auditEntityName.toString(),style: Theme.of(context).textTheme.headline6,overflow: TextOverflow.ellipsis,),
          subtitle: Text(Jiffy(auditEntities.entityEndDate).format("MMMM do yyyy, h:mm:ss a").toString(),style: Theme.of(context).textTheme.subtitle1,)
        ),
      ),
    );
  }

  Future<void> _onDeleteAuditEntity(BuildContext context, AuditEntity? auditEntities) async {
    final didRequestDelete = await showAlertDialog(context,
        defalutActionText: 'OK',
        content: 'Are you sure that you want to delete?',
        title: 'Delete Audit Entity',
        cancleActiontext: 'Cancel');
    if(didRequestDelete == true)
      {
        BlocProvider.of<AuditEntitiesBloc>(context).add(DeleteAuditEntityEvent(auditEntities!));
      }
   }

  Future<void> _onEditAuditEntity(BuildContext context, AuditEntity? auditEntities) async {
    var values = auditEntities!.auditEntityName.toString();
    final didRequestDelete = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Audit Entity'),
        content: TextField(
          controller: TextEditingController()..text = values,
            onChanged:(value) {
              setState(() {
                values = value;
              });
            },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('UPDATE'),
          ),
        ],
      ),
    );
    if(didRequestDelete == true)
    {
      BlocProvider.of<AuditEntitiesBloc>(context).add(UpdateAuditEntityEvent(auditEntities.copyWith(auditEntityName: values)));
    }
  }
  void _onAddAuditEntity(BuildContext context) {
    BlocProvider.of<AuditEntitiesBloc>(context)
        .add(const AddAuditEntityEvent());
  }
}
