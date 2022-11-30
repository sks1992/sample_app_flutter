class NoteModel {

  NoteModel({
    required this.title,
    required this.description,
  });
  late final String title;
  late final String description;

  NoteModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}