class TodoModel {
  String title;
  bool isCompleted;

  TodoModel({required this.title, this.isCompleted = false});

  Map<String, dynamic> toJson() => {'title': title, 'isCompleted': isCompleted};

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      TodoModel(title: json['title'], isCompleted: json['isCompleted']);
}
