import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemHeight: size.height*0.4,
        itemWidth: size.width*0.6,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context,'details',arguments: ''),
            child: ClipRRect(borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(placeholder: AssetImage('assets/no-image.jpeg'), 
              image: NetworkImage('https://via.placeholder.com/300x400')),
            )
          );
        },
      ),
    );
  }
}