import 'package:flutter/material.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  final List topRated;

  const TopRatedMoviesWidget({super.key, required this.topRated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Rated Movies',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
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
                                          topRated[index]['poster_path']))),
                        ),
                        Container(
                          child: Text(
                            topRated[index]['original_title'] != null
                                ? topRated[index]['original_title']
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
