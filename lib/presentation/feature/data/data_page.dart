import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/data/data_screen.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_bloc.dart';
import 'package:architecture_demo/data/data_source/remote.dart';
import 'package:architecture_demo/data/repository/data_repository.dart';
import 'package:architecture_demo/domain/repository/data_repository.dart';

@RoutePage()
class DataPage extends StatelessWidget {
  late final RemoteData _remoteData;
  late final IDataRepository _repository;

  DataPage({super.key}) {
    // We initialize the Repository and RemoteData here and pass it as dependency
    // in perfect scenario we use Dependency Injection to bypass the passing as dependency issue
    // but we are not doing it here in order to keep it simple.
    _remoteData = RemoteData();
    _repository = DataRepository(_remoteData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DataBloc(_repository),
      child: DataScreen(),
    );
  }
}
