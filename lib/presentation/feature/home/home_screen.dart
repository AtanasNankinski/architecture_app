import 'package:architecture_demo/presentation/feature/home/bloc/home_effect.dart';
import 'package:architecture_demo/presentation/feature/home/bloc/home_event.dart';
import 'package:architecture_demo/shared/core/base/bloc_effect_listener.dart';
import 'package:architecture_demo/shared/router/router.dart';
import 'package:architecture_demo/shared/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/presentation/feature/home/bloc/home_bloc.dart';
import 'package:architecture_demo/shared/components/base_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Home",
      child: BlocEffectListener<HomeBloc, HomeEffect>(
        child: BlocBuilder<HomeBloc, String>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24,),
                Text(state),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangeTextEvent());
                  },
                  child: Text("Change Text"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(ResetTextEvent());
                  },
                  child: Text("Reset Text"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(DataRoute());
                  },
                  child: Text("Data Screen"),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
