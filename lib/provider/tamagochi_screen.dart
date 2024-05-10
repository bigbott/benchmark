

import 'package:flutter/material.dart';
import 'package:benchmark/provider/puppy_widget.dart';

class TamagochiScreen extends StatelessWidget {
  final String title;
  const TamagochiScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const PuppyWidget(),
     
    ); 
  }

}