import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _PuppyCubit extends Cubit<double> {
  _PuppyCubit() : super(100.0);

  void increment() {
    if (state > 500) {
      double x = state - 100;
      emit(state - x);
    } else {
      emit(state + 1);
    }
  }
}

class PuppyWidget extends StatelessWidget {
  const PuppyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _PuppyCubit(), child: const _InnerWidget());
  }
}

class _InnerWidget extends StatelessWidget {
  const _InnerWidget();
  @override
  Widget build(BuildContext context) {
    final puppyCubit = BlocProvider.of<_PuppyCubit>(context);
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<_PuppyCubit, double>(
              builder: (context, state) {
                return Image(
                  image: const AssetImage('assets/images/puppy.png'),
                  width: state,
                );
              },
            ),
          ],
        ),
      ),
      Positioned.fill(
        bottom: 50,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              onPressed: () async {
                for (var i = 0; i < 400; i++) {
                  await Future.delayed(const Duration(milliseconds: 20));
                  puppyCubit.increment();
                }
                
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
