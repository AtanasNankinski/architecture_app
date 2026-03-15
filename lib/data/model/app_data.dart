import 'package:equatable/equatable.dart';

class AppData extends Equatable {
  final String id;
  final String title;
  final int dataNumber;
  final bool isActive;

  const AppData(this.id, this.title, this.dataNumber, this.isActive);

  factory AppData.fromJson(Map<String, dynamic> json) =>
    AppData(
      json['id'] ?? "",
      json['title'] ?? "",
      json['dataNumber'] ?? 0,
      json['isActive'] ?? false,
    );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'dataNumber': dataNumber,
    'isActive': isActive
  };

  @override
  List<Object?> get props => [id];
}
