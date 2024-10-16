import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note/Models/NoteModel.dart';
import 'package:my_note/features/home/ui/HomeScreen.dart';
import 'package:my_note/features/NoteEditing/CreatingNoteScreen.dart';
import 'package:my_note/features/NoteEditing/EditNoteScreen.dart';
import 'package:my_note/features/auth/LogInScreen.dart';
import 'package:my_note/features/auth/SignUpScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('note');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LogInScreen(),
      initialRoute: 'login',
      routes: {
        'login': (context) => LogInScreen(),
        'signup': (context) => SignUpScreen(),
        'home': (context) => HomeScreen(),
        'creatingNote': (context) => CreatingNoteScreen(),
        'editingNote': (context) => EditNoteScreen(),
      },
    );
  }
}
