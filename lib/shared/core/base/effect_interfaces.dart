import 'package:architecture_demo/shared/core/error/error.dart';

abstract class IStartLoadingEffect {
  const IStartLoadingEffect();
}

abstract class IStopLoadingEffect {
  const IStopLoadingEffect();
}

abstract class IShowErrorEffect {
  final AppError error;

  const IShowErrorEffect(this.error);
}
