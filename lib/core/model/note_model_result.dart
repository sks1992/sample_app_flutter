class NoteModelResult {
  NoteModelResult({
    this.title,
    this.description,
    this.userId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  late final String? title;
  late final String? description;
  late final String? userId;
  late final String? id;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? v;

  NoteModelResult.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    userId = json['userId'];
    id = json['_id'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    v = json['__v'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}
