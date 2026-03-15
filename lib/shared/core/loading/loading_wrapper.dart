import 'package:architecture_demo/shared/core/loading/loading_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/extensions/common.dart';
import 'package:architecture_demo/shared/styles/colors.dart';

class LoadingWrapper extends StatelessWidget {
  final Widget? child;

  const LoadingWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, bool>(
      builder: (context, isLoading) =>
        Stack(
          children: [
            child ?? SizedBox.shrink(),
            if(isLoading) ...[
              SizedBox(
                height: context.height,
                width: context.width,
                child: ModalBarrier(color: AppColors.modalBarrierColor, dismissible: false),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ],
        ),
    );
  }
}
