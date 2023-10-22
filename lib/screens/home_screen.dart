import 'package:fate_go_2023/providers/movies_provider.dart';
import 'package:fate_go_2023/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Colocar la instancia MoviesProvider
    final moviesProvider=Provider.of<MoviesProvider>(context);
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
          child: Text('Peliculas cinema')
        ),
      ),
      body: Column(
        children: [
          CardSwiper(
            movies: moviesProvider.onDisplayMovies,
          ), MovieSliderA(
            movies: moviesProvider.popularMovies,
          )
        ],
      ),
    );
  }
}