import 'package:flutter/services.dart';

class RemoteData {
  Future<String> getData() async {
    // Simulate Http call delay
    await Future.delayed(Duration(seconds: 2));

   return await rootBundle.loadString(
      'assets/data/app_data.json',
    );
  }
}