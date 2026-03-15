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
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, loadingState) =>
        Stack(
          children: [
            child ?? SizedBox.shrink(),
            if(loadingState.isLoading) ...[
              SizedBox(
                height: context.height,
                width: context.width,
                child: ModalBarrier(color: AppColors.modalBarrierColor, dismissible: false),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    if(loadingState.primaryOperationLabel != null) ...[
                      SizedBox(height: 16),
                      Text(
                        loadingState.primaryOperationLabel!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                    if(loadingState.operationCount > 1) ...[
                      SizedBox(height: 8),
                      Text(
                        '${loadingState.operationCount} operations running',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
    );
  }
}
