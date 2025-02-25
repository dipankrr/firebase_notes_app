import 'package:firebase_notes_app/pages/add_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

      //   MasonryGridView.count(
      //     itemCount: 10,
      //     crossAxisCount: 4,
      //     mainAxisSpacing: 4,
      //     crossAxisSpacing: 4,
      //     itemBuilder: (context, index) {
      //     return Container(
      //       color: Colors.blue,
      //       height: 30,
      //     );
      //   },
      // ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white24,
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
