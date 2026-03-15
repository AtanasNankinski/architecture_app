import 'package:architecture_demo/shared/core/error/error.dart';

abstract class IStartLoadingEffect {
  const IStartLoadingEffect();
  String get identifier;
  String get label;
}

abstract class IStopLoadingEffect {
  const IStopLoadingEffect();
  String get identifier;
}

abstract class IShowErrorEffect {
  final AppError error;

  const IShowErrorEffect(this.error);
}
