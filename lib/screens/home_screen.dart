import 'package:fate_go_2023/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    return SafeArea(
      child: {
        body: Text('Home Screen ;)'),
      }
    )
    */
    return Scaffold(
      appBar: AppBar(
        elevation:10,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded))
        ],
        title: const Center(
          child: Text('Fate Grand Order')
        ),
      ),
      body: const Column(
        children: [CardSwiper(), MovieSliderA()],
      ),
    );
  }
}