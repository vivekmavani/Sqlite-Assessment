import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_assessment/features/sqlite_assessment/presentation/bloc/audit_entities_bloc.dart';
import 'features/sqlite_assessment/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuditEntitiesBloc>()..add(const GetAllAuditEntityEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Audit Entities',
        home: HomePage(),
      ),
    );
  }
}