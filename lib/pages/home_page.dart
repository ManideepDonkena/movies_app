import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movies_app/widgets/nowPlaying.dart';
import 'package:movies_app/widgets/topRated.dart';
import 'package:movies_app/widgets/trending.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  List trendingMovies = [];
  List topRatedMovies = [];
  List nowPlayingMovies = [];

  Future getTrending() async {
    var responseTrending = await http.get(Uri.https(
        'api.themoviedb.org',
        '/3/trending/all/day',
        {'api_key': 'a1c936ea55cb58f2bda7fd7cdb1de176'}));
    var jsonDataTrending = jsonDecode(responseTrending.body);
    setState(() {
      trendingMovies = jsonDataTrending['results'];
    });
  }

  Future getTopRated() async {
    var responseTopRated = await http.get(Uri.https('api.themoviedb.org',
        '3/movie/top_rated', {'api_key': 'a1c936ea55cb58f2bda7fd7cdb1de176'}));
    var jsonDataTopRated = jsonDecode(responseTopRated.body);
    setState(() {
      topRatedMovies = jsonDataTopRated['results'];
    });
  }

  Future getNowPlaying() async {
    var responseNowPlaying = await http.get(Uri.https(
        'api.themoviedb.org',
        '/3/movie/now_playing',
        {'api_key': 'a1c936ea55cb58f2bda7fd7cdb1de176'}));
    var jsonDataNowPlaying = jsonDecode(responseNowPlaying.body);
    setState(() {
      nowPlayingMovies = jsonDataNowPlaying['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getTopRated();
    getTrending();
    getNowPlaying();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Movies App'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          TrendingMoviesWidget(trending: trendingMovies),
          TopRatedMoviesWidget(topRated: topRatedMovies),
          NowPlayingMoviesWidget(nowPlaying: nowPlayingMovies),
        ],
      ),
    );
  }
}
