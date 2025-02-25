import 'package:flutter/material.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
             decoration: InputDecoration(
               hintText: 'Title',
               hintStyle: TextStyle(fontSize: 40)

             ),
            )
          ],
        ),
      ),
    );
  }
}
