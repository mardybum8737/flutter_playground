// class MovieModel {
//   final String originalTitle, posterPath;
//   final int id;

//   MovieModel.fromJson(Map<String, dynamic> json)
//       : originalTitle = json['original_title'],
//         posterPath = json['poster_path'],
//         id = json['id'];
// }
class MovieModel {
  final bool adult, video;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;
  final List<int> genreIds;
  final int id, voteCount;
  final double popularity, voteAverage;

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        video = json['video'],
        backdropPath = json['backdrop_path'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        genreIds = List<int>.from(json['genre_ids'].map((x) => x.toInt())),
        id = json['id'].toInt(),
        popularity = json['popularity'].toDouble(),
        voteAverage = json['vote_average'].toDouble(),
        voteCount = json['vote_count'].toInt();
}
