import 'package:architecture_demo/data/repository/data_repository.dart';
import 'package:architecture_demo/domain/repository/data_repository.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/data/data_screen.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_bloc.dart';

@RoutePage()
class DataPage extends StatelessWidget {
  DataPage({super.key});

  // We initialize the Repository here and pass it as dependency
  // in perfect scenario we use Dependency Injection to bypass the passing as dependency issue
  // but we are not doing it here in order to keep it simple.
  final IDataRepository _repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DataBloc(_repository),
      child: DataScreen(),
    );
  }
}
