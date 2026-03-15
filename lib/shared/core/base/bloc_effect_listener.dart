import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/base/base_bloc.dart';
import 'package:architecture_demo/shared/core/base/effect_interfaces.dart';
import 'package:architecture_demo/shared/core/error/error_bloc.dart';
import 'package:architecture_demo/shared/core/loading/loading_bloc.dart';

class BlocEffectListener<B extends BaseBloc<dynamic, dynamic, FX>, FX> extends StatelessWidget {
  final Widget child;

  const BlocEffectListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<B>();

    return StreamBuilder<FX>(
      stream: bloc.effects,
      builder: (context, snapshot) {
        final effect = snapshot.data;

        if (effect != null) {
          _handleEffect(context, effect);
        }

        return child;
      },
    );
  }

  void _handleEffect(BuildContext context, FX effect) {
    if (effect is IStartLoadingEffect) {
      context.read<LoadingBloc>().add(StartLoading());
    }

    if (effect is IStopLoadingEffect) {
      context.read<LoadingBloc>().add(StopLoading());
    }

    if (effect is IShowErrorEffect) {
      context.read<ErrorBloc>().add(ShowError(effect.error));
    }
  }
}
