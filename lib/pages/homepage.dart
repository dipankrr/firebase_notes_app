import 'package:firebase_notes_app/components/note_card.dart';
import 'package:firebase_notes_app/pages/add_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [

          Expanded(
            child: MasonryGridView.count(
              itemCount: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 5,
              itemBuilder: (context, index) {
                String text = "It does not include any special symbols  escape sequences or syntax issues. The text consists only of letters, serted into a string without modification. Whether you are using this in a programming language like Python, Dart, JavaScript, or any other language that supports single-quoted strings, you should not encounter any problems";
              return

                NoteCard(indx: 1, noteText: text, onIconTap: (){}, delFunc: (){}, titleText: 'This is titleThis is This is titletitleThis is title',);
            },
                  ),
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
