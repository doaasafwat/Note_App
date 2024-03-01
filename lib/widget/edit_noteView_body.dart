import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/custom_appBar.dart';
import 'package:notes_app/widget/custom_textfield.dart';
import 'package:notes_app/widget/edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

String? title, content;

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subTitle = content ?? widget.note.subTitle;
            widget.note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          text: 'Edit Note',
          icon: Icons.check,
        ),
        const SizedBox(
          height: 35,
        ),
        CustomTextField(
          onChanged: (vaule) {
            title = vaule;
          },
          hintText: widget.note.title,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(
          onChanged: (vaule) {
            content = vaule;
          },
          hintText: widget.note.subTitle,
          maxLines: 5,
        ),
        const SizedBox(
          height: 16,
        ),
        EditNoteColorList(
          note: widget.note,
        ),
      ]),
    );
  }
}
