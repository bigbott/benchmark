import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _controller = _PuppyController();

class _PuppyController extends GetxController {
  var count = 100.0.obs;

  increment() {
    count.value++;
    if (count.value > 500) {
      count.value = 100;
    }
  }
}

class PuppyWidget extends StatelessWidget {
  const PuppyWidget({
    super.key,
  });
  //PuppyController get controller => Get.put(PuppyController());
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnimatedSize(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              child: Obx(
                () => Image(
                  image: const AssetImage('assets/images/puppy.png'),
                  width: _controller.count.value,
                ),
              ),
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
                  _controller.increment();
                }
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
