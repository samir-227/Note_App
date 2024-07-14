class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure({required this.errMessage});
}

class AddNoteSuccess extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}
