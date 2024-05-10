import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _PuppyModel with ChangeNotifier {
  //notifier
  var count = 100.0;
  void increment() {
    count++;
    if (count > 500) {
      count = 100;
    }
    notifyListeners();
  }
}

class PuppyWidget extends StatelessWidget {
  const PuppyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        //provider is here
        create: (context) => _PuppyModel(),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<_PuppyModel>(
                    builder: (context, puppyModel, child) {
                  return Image(
                    image: const AssetImage('assets/images/puppy.png'),
                    width: puppyModel.count,
                  );
                }),
              ],
            ),
          ),
          Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<_PuppyModel>(
                builder: (_, puppyModel, child) {
                  return ElevatedButton(
                      onPressed: () async {
                        for (var i = 0; i < 400; i++) {
                          await Future.delayed(
                              const Duration(milliseconds: 20));
                          puppyModel.increment();
                        }
                      },
                      child: const Text("Feed puppy"));
                },
              ),
            ),
          )
        ]));
  }
}
