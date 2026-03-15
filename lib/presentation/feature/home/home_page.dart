import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/home/home_screen.dart';
import 'package:architecture_demo/presentation/feature/home/bloc/home_bloc.dart';
import 'package:architecture_demo/data/repository/home_repository.dart';
import 'package:architecture_demo/domain/repository/home_repository.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  late final IHomeRepository _repository;

  HomePage({super.key}) {
    _repository = HomeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(_repository),
      child: HomeScreen(),
    );
  }
}
