/// Home Repository
///
/// Very simple repository class that has the main purpose of getting simple string data
/// and serving the example of layer separation.
abstract class IHomeRepository {
  Future<String> getHomeText();
}