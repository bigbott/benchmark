import 'package:flutter/material.dart';
import 'package:get/get.dart';

//final _controller = _PuppyController();

class _PuppyController extends GetxController {
  var count = 100.0;

  void increment() {
    count++;
    if (count > 500) {
      count = 100;
    }
    update();
  }
}

class PuppyWidget extends StatelessWidget {
   PuppyWidget({
    super.key,
  });
  //PuppyController get controller => Get.put(PuppyController());
  final controller = Get.put<_PuppyController>(_PuppyController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GetBuilder<_PuppyController>(
              builder: (controller) => Image(
                image: const AssetImage('assets/images/puppy.png'),
                width: controller.count,
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
                  controller.increment();
                }
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
