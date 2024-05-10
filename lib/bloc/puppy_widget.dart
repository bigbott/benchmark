import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class CounterEvent {}

class Increment extends CounterEvent {}

class _PuppyBloc extends Bloc<CounterEvent, double> {
  _PuppyBloc() : super(100.0) {
    on<Increment>((event, emit) {
      if (state > 500) {
      emit(state - 400);
    } else {
      emit(state + 1);
    }
    });
  }
}

class PuppyWidget extends StatelessWidget {
  const PuppyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _PuppyBloc(), child: const _InnerWidget());
  }
}

class _InnerWidget extends StatelessWidget {
  const _InnerWidget();
  @override
  Widget build(BuildContext context) {
    final puppyBloc = BlocProvider.of<_PuppyBloc>(context);
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<_PuppyBloc, double>(
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
                  puppyBloc.add(Increment());
                }
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
