import 'package:flutter/material.dart';
import 'package:flutter_playground/A10/services/api_service.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  String formatTime(int time) {
    int hours = time ~/ 60;
    int minutes = time % 60;
    return '${hours}h ${minutes}min';
  }

  String joinGenres(List genres) {
    return genres.map((genre) => genre['name'].toString()).toList().join(', ');
  }

  List<bool> convertScoreToArray(double score) {
    int halfScore = (score / 2).round();
    return List.generate(5, (index) => index < halfScore ? true : false)
        .toList();
  }

  List<Widget> buildStarIcons(List<bool> scores) {
    return scores.map((star) {
      return star
          ? const Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : const Icon(
              Icons.star,
              color: Colors.white30,
            );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        foregroundColor: Colors.white,
        title: const Text(
          '',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: ApiService.getDetailMovie(id: id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movie = snapshot.data!;
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildStarIcons(
                              convertScoreToArray(movie.voteAverage)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatTime(movie.runtime),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              joinGenres(movie.genres),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          width: 360,
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              movie.overview,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
