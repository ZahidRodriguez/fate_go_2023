import 'package:flutter/material.dart';

class MovieSliderA extends StatelessWidget {
  const MovieSliderA({super.key});

  @override
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return Container(
      width:double.infinity,
      height: Size.height*0.25,
      color:Colors.red,
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
              itemCount: 20,
              itemBuilder: (_,int index)=>_MoviePoster(),
            )
          )
        ],
      )
    );
  }
}
class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

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
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpeg'),
                image: AssetImage('assets/no-image.jpeg'),
                width: 130,
                height: 185,
              )
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Magna tempor voluptate reprehenderit commodo. Deserunt dolor nostrud proident non exercitation elit laboris deserunt ut. Ex non minim nostrud nulla est tempor eu commodo. In culpa officia anim mollit consectetur proident enim.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      ),
    );
  }
}

