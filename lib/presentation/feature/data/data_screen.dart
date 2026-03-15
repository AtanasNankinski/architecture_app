import 'package:architecture_demo/presentation/feature/data/bloc/data_event.dart';
import 'package:architecture_demo/shared/components/data_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/data/bloc/data_bloc.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_state.dart';
import 'package:architecture_demo/shared/core/base/bloc_effect_listener.dart';
import 'package:architecture_demo/shared/components/base_scaffold.dart';
import 'package:architecture_demo/presentation/feature/data/bloc/data_effect.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Data",
      child: BlocEffectListener<DataBloc, DataEffect>(
        child: BlocBuilder<DataBloc, DataState>(
          buildWhen: (prev, next) => !listEquals(prev.data, next.data),
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index];

                return DataListTile(
                  id: item.id,
                  title: item.title,
                  dataNumber: item.dataNumber,
                  isActive: item.isActive,
                  onTap: () {
                    context.read<DataBloc>().add(DeleteFromDataEvent(item));
                  },
                );
              }
            );
          },
        ),
      ),
    );
  }
}
