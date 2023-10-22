import 'package:flutter/material.dart';
import 'package:fate_go_2023/widgets/casting_slider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  


  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin Nombre';
    return const Scaffold(
      body: CustomScrollView(
        //widget con compotramiente predefinido al scroll
        slivers: [
          _CostumAppBar(),SliverList(delegate: SliverChildListDelegate.fixed(
            [
              _PosterAndTitle(),
              _Overview(),
              CastingSlider()
            ]
          ))
        ],
      ),
      /*Column(
        children: [CastingSlider()],
      ),*/
    );
  }
}
class _CostumAppBar extends StatelessWidget {
  const _CostumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //WIDGET PARA QUE SE AJUSTE EL TAMAÑO
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //Eliminar padding
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text('movie.title',
            style: TextStyle(fontSize: 18),

          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/loading.gif'),
        ),
      ),
    );
  }
}
class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpeg'),
                image: AssetImage('assets/no-image.jpeg'),
                height: 250,
              )
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'movie.titleOrigin',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
                ),
                Text(
                  'movie.title',
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(Icons.start_outlined,size: 20,color: Colors.deepPurple,),
                    SizedBox(width: 5),
                    Text(
                      'movie.voteAvenger',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(/*EdgeInsets.symmetric es un constructor con nombre */
        horizontal: 20,
        vertical: 10
      ),
      child: const Text(
        'Do proident mollit id culpa esse sit eiusmod incididunt. Exercitation eu velit do nulla. Et commodo laboris voluptate consequat enim in et ea. Laboris quis eiusmod irure Lorem aliquip sit eu et sunt. Cillum duis cupidatat et pariatur adipisicing.',
        textAlign:TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
class ActorSlider extends StatelessWidget {
  const ActorSlider({super.key});

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
              'Reparto',
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
              itemBuilder: (_,int index)=>const _ActorPoster(),
            )
          )
        ],
      )
    );
  }
}
class _ActorPoster extends StatelessWidget {
  const _ActorPoster({super.key});

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

