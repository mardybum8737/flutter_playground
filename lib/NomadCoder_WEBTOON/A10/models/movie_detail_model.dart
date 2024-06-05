class MovieDetailModel {
  final bool adult, video;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title,
      homepage,
      imdbId,
      status,
      tagline;
  final int id, voteCount, budget, runtime, revenue;
  final double popularity, voteAverage;
  final List<dynamic> genres,
      originCountry,
      productionCompanies,
      productionCountries,
      spokenLanguages;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        video = json['video'],
        backdropPath = json['backdrop_path'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        id = json['id'],
        popularity = json['popularity'].toDouble(),
        voteAverage = json['vote_average'].toDouble(),
        voteCount = json['vote_count'],
        budget = json['budget'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        homepage = json['homepage'] ?? '',
        imdbId = json['imdb_id'],
        status = json['status'],
        tagline = json['tagline'] ?? '',
        genres = json['genres'] ?? [],
        originCountry = json['origin_country'] ?? [],
        productionCompanies = json['production_companies'] ?? [],
        productionCountries = json['production_countries'] ?? [],
        spokenLanguages = json['spoken_languages'] ?? [];
}
