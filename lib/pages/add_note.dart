import 'package:firebase_notes_app/components/form_widget.dart';
import 'package:flutter/material.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Container( height: 20, width: 20, color: Colors.white54,),

      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormWidget(hintTxt: 'Title', fontSize: 28, fontWeight: FontWeight.bold,),

              FormWidget(hintTxt: 'Start writing . . . .', fontSize: 21,),
            ],
          ),
        ),
      ),
    );
  }
}
