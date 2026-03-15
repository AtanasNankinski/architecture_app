import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:architecture_demo/data/model/app_data.dart';
import 'package:architecture_demo/domain/repository/data_repository.dart';

class DataRepository implements IDataRepository{
  @override
  Future<List<AppData>> deleteDataValue(AppData value) async {
    // Simulate Http call delay
    await Future.delayed(Duration(seconds: 2));

    final jsonString = await rootBundle.loadString(
      'assets/data/app_data.json',
    );

    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

    final list = decoded['app_data'] as List<dynamic>;

    final data = list
      .map((e) => AppData.fromJson(e as Map<String, dynamic>))
      .toList();

    if(data.contains(value)) data.remove(value);

    return data;
  }

  @override
  Future<List<AppData>> loadData() async {
    // Simulate Http call delay
    await Future.delayed(Duration(seconds: 2));

    final jsonString = await rootBundle.loadString(
      'assets/data/app_data.json',
    );

    final decoded = jsonDecode(jsonString) as Map<String, dynamic>;

    final list = decoded['app_data'] as List<dynamic>;

    return list
        .map((e) => AppData.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
