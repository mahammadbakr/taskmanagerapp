import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'isDone')
  bool isDone;
  @JsonKey(name: 'date')
  DateTime? date;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.isDone = false,
    this.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    bool isDone = false,
    DateTime? date,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone,
      date: date ?? this.date,
    );
  }
}
