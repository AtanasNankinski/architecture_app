import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:architecture_demo/shared/core/error/error.dart';
import 'package:architecture_demo/shared/core/error/error_bloc.dart';
import 'package:architecture_demo/shared/extensions/common.dart';
import 'package:architecture_demo/shared/styles/colors.dart';

class ErrorWrapper extends StatelessWidget {
  final Widget? child;

  const ErrorWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ErrorBloc, AppError?>(
      builder: (context, state) =>
        Stack(
          children: [
            child ?? SizedBox.shrink(),
            if(state != null)...[
              SizedBox(
                height: context.height,
                width: context.width,
                child: ModalBarrier(color: AppColors.modalBarrierColor, dismissible: false),
              ),
              Center(
                child: AlertDialog.adaptive(
                  title: Text(state.title),
                  content: Text(state.description),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        context.read<ErrorBloc>().add(ClearError());
                      },
                      child: Text("Ok"),
                    )
                  ],
                ),
              ),
            ],
          ],
        ),
    );
  }
}
