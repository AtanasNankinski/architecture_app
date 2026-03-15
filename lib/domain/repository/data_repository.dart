import 'package:architecture_demo/data/model/app_data.dart';

abstract class IDataRepository {
  ///Method loading the data
  ///
  /// This method serves for loading the data from the json file mocking http request
  Future<List<AppData>> loadData();

  ///Method for deleting single data value
  ///
  /// This method passes single [value] of type [AppData] that is in the data list and deletes this specific list from the data list.
  Future<List<AppData>> deleteDataValue(AppData value);
}
