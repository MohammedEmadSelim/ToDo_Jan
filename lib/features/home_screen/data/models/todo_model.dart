class TodoModel {
  final String id;
  final String title;
  final String des;
  final String deadline;
  final String? image;

  TodoModel({
    required this.id,
    required this.title,
    required this.des,
    required this.deadline,
    this.image,
  });

  /// 🔁 From Firestore
  factory TodoModel.fromJson(Map<String, dynamic> json, String docId) {
    return TodoModel(
      id: docId,
      title: json['title'] ?? '',
      des: json['des'] ?? '',
      deadline: json['deadline'] ?? '',
      image: json['image'],
    );
  }

  /// 🔼 To Firestore
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'des': des,
      'deadline': deadline,
      'image': image,
    };
  }
}