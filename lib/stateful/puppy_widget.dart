import 'package:flutter/material.dart';

class PuppyWidget extends StatefulWidget {
  const PuppyWidget({
    super.key,
  });

  @override
  State<PuppyWidget> createState() => _PuppyWidgetState();
}

class _PuppyWidgetState extends State<PuppyWidget> {
  double _counter = 100;

  void _incrementCounter() {
    setState(() {
      _counter ++;
      if (_counter > 500) {
        _counter = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              image: const AssetImage('assets/images/puppy.png'),
              width: _counter,
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
                  _incrementCounter();
                }
              },
              child: const Text("Feed puppy")),
        ),
      )
    ]);
  }
}
