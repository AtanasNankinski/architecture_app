import 'package:architecture_demo/data/model/app_data.dart';
import 'package:equatable/equatable.dart';

class DataState extends Equatable {
  final List<AppData> data;

  const DataState(this.data);

  DataState copyWith(List<AppData>? data) => DataState(
    data ?? this.data,
  );

  @override
  List<Object?> get props => [data];
}
