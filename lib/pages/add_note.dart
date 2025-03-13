import 'package:firebase_notes_app/components/coolbtn.dart';
import 'package:firebase_notes_app/components/form_widget.dart';
import 'package:flutter/material.dart';

import '../database/FirestoreDBHelper.dart';
import '../models/note_model.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    final FirestoreDBHelper _dbHelper = FirestoreDBHelper();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () async {
              // add note
            await  _dbHelper.addNote(Note(
              id: '',
              title: titleController.text,
              content: noteController.text,
              timestamp: DateTime.now(),
            ));
            Navigator.pop(context);
            }, icon: Icon(Icons.save))
          ],
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormWidget(hintTxt: 'Title', fontSize: 28, fontWeight: FontWeight.bold, controller: titleController,),

              FormWidget(hintTxt: 'Start writing . . . .', fontSize: 21, controller: noteController,),

              GradientButton(onPressed: (){}, text: 'Click here')

            ],
          ),
        ),
      ),
    );
  }
}
