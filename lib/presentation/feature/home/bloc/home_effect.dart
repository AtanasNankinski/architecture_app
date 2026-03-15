import 'package:architecture_demo/shared/core/error/error.dart';
import 'package:architecture_demo/shared/core/base/effect_interfaces.dart';

sealed class HomeEffect {}

final class ShowErrorEffect extends HomeEffect implements IShowErrorEffect {
  @override
  final AppError error;

  ShowErrorEffect(this.error);
}

final class StartLoadingEffect extends HomeEffect implements IStartLoadingEffect {
  @override
  final String identifier;
  @override
  final String label;

  StartLoadingEffect(this.identifier, this.label);
}

final class StopLoadingEffect extends HomeEffect implements IStopLoadingEffect {
  @override
  final String identifier;

  StopLoadingEffect(this.identifier);
}
