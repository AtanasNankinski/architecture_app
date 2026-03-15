import 'package:architecture_demo/shared/core/error/error.dart';
import 'package:architecture_demo/shared/core/base/effect_interfaces.dart';

sealed class DataEffect {}

final class StartLoadingEffect extends DataEffect implements IStartLoadingEffect {
  @override
  final String identifier;
  @override
  final String label;

  StartLoadingEffect(this.identifier, this.label);
}

final class StopLoadingEffect extends DataEffect implements IStopLoadingEffect {
  @override
  final String identifier;

  StopLoadingEffect(this.identifier);
}

final class ShowErrorEffect extends DataEffect implements IShowErrorEffect {
  @override
  final AppError error;

  ShowErrorEffect(this.error);
}
