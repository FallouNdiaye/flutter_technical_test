import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/screens/Components/lottie.dart';
import 'package:flutter_technical_test/screens/Components/resources.dart';


class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
  }) : super(key: key);

  final AsyncValue<T> value;

  final Widget Function(T data) data;

  final Widget Function()? loading;

  final Widget Function(Object error, StackTrace stacktrace)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading:
          loading ?? () => const LottieWidget(assets: Resources.lottieLoading),
      error: error ??
          (e, __) {
            return LottieWidget(
                assets: Resources.lottieError,
                description: 'Erreur de connexion');
          },
    );
  }
}
