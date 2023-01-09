import 'package:flutter/material.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  final List nowPlaying;

  const NowPlayingMoviesWidget({super.key, required this.nowPlaying});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Now Playing Movies',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowPlaying.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          nowPlaying[index]['poster_path']))),
                        ),
                        Container(
                          child: Text(
                            nowPlaying[index]['original_title'] != null
                                ? nowPlaying[index]['original_title']
                                : 'Loading',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
