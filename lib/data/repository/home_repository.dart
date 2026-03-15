import 'package:architecture_demo/domain/repository/home_repository.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<String> getHomeText() async {
    await Future.delayed(Duration(seconds: 4));

    return "This is some test text.";
  }
}