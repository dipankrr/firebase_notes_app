import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/note_model.dart';

class FirestoreDBHelper {
  final FirebaseFirestore _firestore;

  FirestoreDBHelper({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final String collectionName = "notes";

  /// 🔹 Add a new note
  Future<String?> addNote(Note note) async {
    try {
      DocumentReference docRef =
      await _firestore.collection(collectionName).add(note.toJson());
      return docRef.id; // Return ID for reference
    } catch (e) {
      debugPrint("Error adding note: $e");
      return null; // Indicate failure
    }
  }

  /// 🔹 Fetch all notes as a Stream (Real-time updates)
  Stream<List<Note>> getNotesStream() {
    try {
      return _firestore
          .collection(collectionName)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => Note.fromJson(doc.id, doc.data()))
          .toList());
    } catch (e) {
      debugPrint("Error fetching notes: $e");
      return Stream.value([]); // Return empty list on failure
    }
  }

  /// 🔹 Update a note
  Future<bool> updateNote(String docId, Note note) async {
    try {
      await _firestore.collection(collectionName).doc(docId).update(note.toJson());
      return true;
    } catch (e) {
      debugPrint("Error updating note: $e");
      return false;
    }
  }

  /// 🔹 Delete a note
  Future<bool> deleteNote(String docId) async {
    try {
      await _firestore.collection(collectionName).doc(docId).delete();
      return true;
    } catch (e) {
      debugPrint("Error deleting note: $e");
      return false;
    }
  }
}
