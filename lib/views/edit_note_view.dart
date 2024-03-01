import 'package:flutter/material.dart';
import 'package:notes_app/widget/edit_noteView_body.dart';
import 'package:notes_app/models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
