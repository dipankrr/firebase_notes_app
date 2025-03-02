import 'package:firebase_notes_app/components/note_card.dart';
import 'package:firebase_notes_app/pages/add_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../database/FirestoreDBHelper.dart';
import '../models/note_model.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

  final FirestoreDBHelper _dbHelper = FirestoreDBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [

            StreamBuilder<List<Note>>(
                 stream: _dbHelper.getNotesStream(),
                 builder: (context, snapshot) {

                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return Expanded(child: Center(child: CircularProgressIndicator()));
                   } else if (snapshot.hasError) {
                     return Expanded(child: Center(child: Text("Error fetching notes")));
                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                     return Expanded(child: Center(child: Text("No Notes Available")));
                   }

                   List<Note> notes = snapshot.data!;

                   return Expanded(
                     child: MasonryGridView.count(
                       itemCount: notes.length,
                       crossAxisCount: 2,
                       mainAxisSpacing: 8,
                       crossAxisSpacing: 5,
                       itemBuilder: (context, index) {

                         Note note = notes[index];
                         return
                           NoteCard(indx: 1, noteText: note.content, onIconTap: (){}, delFunc: (){}, titleText: note.title,);
                       },
                     ),
                   );
                 }
            ),

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
       // backgroundColor: Colors.white,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNotePage()),
            );
          },
          child: Icon(Icons.add) ,
      ),
    );
  }
}
