import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/loading/loading_wrapper.dart';
import 'package:architecture_demo/shared/router/router.dart';
import 'package:architecture_demo/shared/core/error/error_bloc.dart';
import 'package:architecture_demo/shared/core/loading/loading_bloc.dart';
import 'package:architecture_demo/shared/core/error/error_wrapper.dart';
import 'package:architecture_demo/shared/styles/theme/theme_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoadingBloc()),
        BlocProvider(create: (_) => ErrorBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            title: "Architecture Demo App",
            theme: state,
            builder: (context, child) =>
                LoadingWrapper(
                  child: ErrorWrapper(
                    child: child,
                  ),
                ),
          );
        },
      ),
    );
  }
}
