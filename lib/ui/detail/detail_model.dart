class DetailModel {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String posterUrl;
  String backdropUrl;
  String overview;
  bool isFavorite;
  Set<int> genreIds;

  DetailModel({
    this.id,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.posterUrl,
    this.backdropUrl,
    this.overview,
    this.isFavorite,
    this.genreIds,
  }) : super();
}