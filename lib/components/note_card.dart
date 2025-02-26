import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NoteCard extends StatelessWidget {
  final String noteText;
  final String titleText;
  final dynamic onIconTap;
  final dynamic delFunc;
  final dynamic tapTextFunc;
  final int indx;
  const NoteCard({super.key, required this.indx, required this.noteText, required this.onIconTap, required this.delFunc,  this.tapTextFunc, required this.titleText, });

  @override
  Widget build(BuildContext context) {
          return
            GestureDetector(

              onLongPress: delFunc,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,  // TODO: different choose colors
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white30)
                ),

                child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 12, right: 12),
                      child: Text(titleText.toString(),
                          style: TextStyle(
                            // letterSpacing: .3,
                            // height: 0.99,
                            fontSize: 21,
                            color:  Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                      child: Text(noteText.toString(),
                        style: TextStyle(
                          // letterSpacing: .3,
                         // height: 0.99,
                          fontSize: 16,
                          color:  Colors.white,
                      )),
                    )
                  ],
                ),
              ),
            );
  }
}
