import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/assets/cubits/add_note_cubit/add_note_state.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/modals/note_view_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteViewModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteViewModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
