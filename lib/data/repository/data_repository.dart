import 'dart:convert';

import 'package:architecture_demo/data/model/app_data.dart';
import 'package:architecture_demo/data/data_source/remote.dart';
import 'package:architecture_demo/domain/repository/data_repository.dart';

class DataRepository implements IDataRepository{
  final RemoteData _remoteData;

  DataRepository(this._remoteData);

  @override
  Future<List<AppData>> deleteDataValue(AppData value) async {
    final rawData = await _remoteData.getData();

    final decoded = jsonDecode(rawData) as Map<String, dynamic>;

    final list = decoded['app_data'] as List<dynamic>;

    final data = list
      .map((e) => AppData.fromJson(e as Map<String, dynamic>))
      .toList();

    if(data.contains(value)) data.remove(value);

    return data;
  }

  @override
  Future<List<AppData>> loadData() async {
    final jsonString = await _remoteData.getData();

    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

    final list = decoded['app_data'] as List<dynamic>;

    return list
        .map((e) => AppData.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
