import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/modals/note_view_model.dart';
import 'package:note_app/views/note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<NoteViewModel>(kNotesBox);
  Hive.registerAdapter<NoteViewModel>(NoteViewModelAdapter());
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
      ),
      home: const NoteView(),
    );
  }
}
