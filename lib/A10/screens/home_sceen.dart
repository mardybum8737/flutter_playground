import 'package:flutter/material.dart';
import 'package:flutter_playground/A10/models/movie_model.dart';
import 'package:flutter_playground/A10/screens/detail_screen.dart';
import 'package:flutter_playground/A10/services/api_service.dart';
import 'package:flutter_playground/A10/widgets/with_title_movie_card.dart';
import 'package:flutter_playground/A10/widgets/wide_movie_card.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<MovieModel>> popularMovies =
      ApiService.getTypeMovies("popular");
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getTypeMovies("nowPlaying");
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getTypeMovies("comingSoon");

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Popular Movies',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FutureBuilder<List<MovieModel>>(
              future: popularMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return WideMovieCard(
                            thumb: snapshot.data![index].posterPath,
                            onTab: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: snapshot.data![index].id,
                                      ),
                                    ),
                                  ),
                                });
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Now in Cinemas'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Now in Cinemas',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FutureBuilder<List<MovieModel>>(
              future: nowPlayingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return WithTitleMovieCard(
                          thumb: snapshot.data![index].posterPath,
                          originalTitle: snapshot.data![index].originalTitle,
                          onTab: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  id: snapshot.data![index].id,
                                ),
                              ),
                            ),
                          },
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Now in Cinemas'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Coming Soon Movies',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FutureBuilder<List<MovieModel>>(
              future: comingSoonMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return WithTitleMovieCard(
                            thumb: snapshot.data![index].posterPath,
                            originalTitle: snapshot.data![index].originalTitle,
                            onTab: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        id: snapshot.data![index].id,
                                      ),
                                    ),
                                  ),
                                });
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Now in Cinemas'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
