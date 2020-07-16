class MovieModel {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String posterUrl;
  String backdropUrl;
  String overview;
  Set<int> genreIds;

  MovieModel({
    this.id,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.posterUrl,
    this.backdropUrl,
    this.overview,
    this.genreIds,
  }) : super();
}
