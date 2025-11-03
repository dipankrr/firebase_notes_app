import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/note_model.dart';

class SupabaseDBHelper {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String tableName = 'notes';

  /// 🔹 Add a new note
  Future<int?> addNote(Note note) async {
    try {
      final response = await _supabase
          .from(tableName)
          .insert(note.toJson())
          .select('id')
          .single();
      return response['id'] as int;
    } catch (e) {
      debugPrint("Error adding note: $e");
      return null;
    }
  }

  /// 🔹 Fetch all notes as a Stream (Real-time updates)
  Stream<List<Note>> getNotesStream() {
    try {
      return _supabase
          .from(tableName)
          .stream(primaryKey: ['id'])
          .order('created_at', ascending: false)
          .map((rows) => rows.map((r) => Note.fromJson(r)).toList());
    } catch (e) {
      debugPrint("Error fetching notes: $e");
      return Stream.value([]);
    }
  }

  /// 🔹 Update a note
  Future<bool> updateNote(int id, Note note) async {
    try {
      await _supabase
          .from(tableName)
          .update(note.toJson())
          .eq('id', id);
      return true;
    } catch (e) {
      debugPrint("Error updating note: $e");
      return false;
    }
  }

  /// 🔹 Delete a note
  Future<bool> deleteNote(int id) async {
    try {
      await _supabase
          .from(tableName)
          .delete()
          .eq('id', id);
      return true;
    } catch (e) {
      debugPrint("Error deleting note: $e");
      return false;
    }
  }
}


// class FirestoreDBHelper {
//   final FirebaseFirestore _firestore;
//
//   FirestoreDBHelper({FirebaseFirestore? firestore})
//       : _firestore = firestore ?? FirebaseFirestore.instance;
//
//   final String collectionName = "notes";
//
//   /// 🔹 Add a new note
//   Future<String?> addNote(Note note) async {
//     try {
//       DocumentReference docRef =
//       await _firestore.collection(collectionName).add(note.toJson());
//       return docRef.id; // Return ID for reference
//     } catch (e) {
//       debugPrint("Error adding note: $e");
//       return null; // Indicate failure
//     }
//   }
//
//   /// 🔹 Fetch all notes as a Stream (Real-time updates)
//   Stream<List<Note>> getNotesStream() {
//     try {
//       return _firestore
//           .collection(collectionName)
//           .orderBy('timestamp', descending: true)
//           .snapshots()
//           .map((snapshot) => snapshot.docs
//           .map((doc) => Note.fromJson(doc.id, doc.data()))
//           .toList());
//     } catch (e) {
//       debugPrint("Error fetching notes: $e");
//       return Stream.value([]); // Return empty list on failure
//     }
//   }
//
//   /// 🔹 Update a note
//   Future<bool> updateNote(String docId, Note note) async {
//     try {
//       await _firestore.collection(collectionName).doc(docId).update(note.toJson());
//       return true;
//     } catch (e) {
//       debugPrint("Error updating note: $e");
//       return false;
//     }
//   }
//
//   /// 🔹 Delete a note
//   Future<bool> deleteNote(String docId) async {
//     try {
//       await _firestore.collection(collectionName).doc(docId).delete();
//       return true;
//     } catch (e) {
//       debugPrint("Error deleting note: $e");
//       return false;
//     }
//   }
// }
