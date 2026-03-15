import 'package:architecture_demo/data/model/app_data.dart';

sealed class DataEvent {}

final class InitEvent extends DataEvent {}

final class LoadDataEvent extends DataEvent {}

final class DeleteFromDataEvent extends DataEvent {
  final AppData value;

  DeleteFromDataEvent(this.value);
}
