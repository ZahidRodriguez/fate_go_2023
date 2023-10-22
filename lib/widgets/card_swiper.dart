import 'package:card_swiper/card_swiper.dart';
import 'package:fate_go_2023/models/models.dart';
import 'package:flutter/material.dart';
class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height*0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height*0.4,
        itemWidth: size.width*0.6,
        itemBuilder: (_,int index){
          final movie=movies[index];
          //print(movie.posterPath);
          //print(movie.fullPosterImg);
          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,'details',arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpeg'), 
                image: NetworkImage(movie.fullPosterImg),
              ),
            )
          );
        },
      ),
    );
  }
}