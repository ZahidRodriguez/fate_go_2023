import 'package:flutter/material.dart';
import 'package:fate_go_2023/models/models.dart';

class MovieSliderA extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSliderA({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Container(
      width:double.infinity,
      height: Size.height*0.25,
      color:Colors.blue.shade300,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_,int index)=>_MoviePoster(movie: movies[index]),
            )
          )
        ],
      )
    );
  }
}
class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details',arguments: 'sdf'),
            child: ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpeg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 150,
              )
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Magna tempor voluptate reprehenderit commodo. Deserunt dolor nostrud proident non exercitation elit laboris deserunt ut. Ex non minim nostrud nulla est tempor eu commodo. In culpa officia anim mollit consectetur proident enim.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      ),
    );
  }
}

