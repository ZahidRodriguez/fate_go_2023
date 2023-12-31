import 'dart:convert';
import 'package:fate_go_2023/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  String _baseUrl='api.themoviedb.org';
  String _apiKey='9dc27117b000e7e5acfb365fa957971a';
  String _lengage='es-MX';

  List<Movie> onDisplayMovies=[];
  List<Movie> popularMovies=[];

  //qwerty
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  getOnDisplayMovies() async{
    var url = Uri.http(_baseUrl, '3/movie/now_playing',{'api_key':_apiKey,'lenguage': _lengage, 
    'page':'1'});
    final response = await http.get(url);
    final Map<String,dynamic> decodeData = json.decode(response.body);
    /*print(decodeData);
    print(response.body);*/
    final nowPlayingResponse=NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies=nowPlayingResponse.results;
    //Le comunicamos a todo widget que estan escuchando que se cambio la data, por lo que debe redibujar
    notifyListeners();
    //print(nowPlayingResponse.results[0].title);
  }
  getPopularMovies() async{
    var url=Uri.http(_baseUrl,'3/movie/popular',{'api_key':_apiKey,'lenguage': _lengage,'page':'1'});
    final response=await http.get(url);
    final popularResponse=PopularResponse.fromRawJson(response.body);

    //Destructirar resultados para cambiar la pagina y mantener los actuales
    //TODO: Destructurar
    popularMovies=[...popularMovies,...popularResponse.results];
    notifyListeners();
  }
}