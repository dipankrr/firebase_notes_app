class Note {
  final String id;
  final String title;
  final String content;
  final DateTime timestamp;

  Note({required this.id, required this.title, required this.content, required this.timestamp});

  /// Convert model to JSON (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  /// Convert Firestore JSON to model
  factory Note.fromJson(String id, Map<String, dynamic> json) {
    return Note(
      id: id,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
    );
  }
}
