import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _puppyProvider =
    NotifierProvider<_PuppyNotifier, double>(_PuppyNotifier.new);

class _PuppyNotifier extends Notifier<double> {
  @override
  double build() {
    return 100.0;
  }

  void increment() {
    state++;
    if (state > 500) {
      state = 100;
    }
  }
}

class PuppyWidget extends ConsumerWidget {
  const PuppyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                return Image(
                  image: const AssetImage('assets/images/puppy.png'),
                  width: ref.watch(_puppyProvider),
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
                  ref.read(_puppyProvider.notifier).increment();
                }
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
