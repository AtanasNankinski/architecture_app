import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/base/base_bloc.dart';
import 'package:architecture_demo/shared/core/base/effect_interfaces.dart';
import 'package:architecture_demo/shared/core/error/error_bloc.dart';
import 'package:architecture_demo/shared/core/loading/loading_bloc.dart';

class BlocEffectListener<B extends BaseBloc<dynamic, dynamic, FX>, FX> extends StatefulWidget {
  final Widget child;

  const BlocEffectListener({super.key, required this.child});

  @override
  State<BlocEffectListener<B, FX>> createState() => _BlocEffectListenerState<B, FX>();
}

class _BlocEffectListenerState<B extends BaseBloc<dynamic, dynamic, FX>, FX> extends State<BlocEffectListener<B, FX>> {
  StreamSubscription<FX>? _subscription;
  FX? _lastProcessedEffect;
  late final LoadingBloc _loadingBloc;
  late final ErrorBloc _errorBloc;

  @override
  void initState() {
    super.initState();
    // Store BLoC references during initState to avoid context issues
    _loadingBloc = context.read<LoadingBloc>();
    _errorBloc = context.read<ErrorBloc>();
    
    final bloc = context.read<B>();

    _subscription = bloc.effects.listen((effect) {
      if (_lastProcessedEffect != effect) {
        _handleEffect(effect);
        _lastProcessedEffect = effect;
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // By just returning the widget.child instance without wrapping it in new widget we don't rebuild the child on this
    // widget's rebuild thus not hurting the performance. With that said DO NOT wrap the widget.child in another Widget!
    return widget.child;
  }

  void _handleEffect(FX effect) {
    if (effect is IStartLoadingEffect) {
      _loadingBloc.add(StartLoading(effect.identifier, effect.label));
    }

    if (effect is IStopLoadingEffect) {
      _loadingBloc.add(StopLoading(effect.identifier));
    }

    if (effect is IShowErrorEffect) {
      _errorBloc.add(ShowError(effect.error));
    }
  }
}
