// class Note {
//   final String id;
//   final String title;
//   final String content;
//   final DateTime timestamp;
//
//   Note({required this.id, required this.title, required this.content, required this.timestamp});
//
//   /// Convert model to JSON (for Firestore)
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'content': content,
//       'timestamp': timestamp.toIso8601String(),
//     };
//   }
//
//   /// Convert Firestore JSON to model
//   factory Note.fromJson(String id, Map<String, dynamic> json) {
//     return Note(
//       id: id,
//       title: json['title'] ?? '',
//       content: json['content'] ?? '',
//       timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
//     );
//   }
// }

class Note {
  final int id; // Supabase uses int for primary key
  final String title;
  final String content;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  /// Convert model to JSON (for insert/update)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }

  /// Convert JSON (from Supabase) to model
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
