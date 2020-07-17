class TvShowModel {
  int id;
  String name;
  double voteAverage;
  String firstAirDate;
  String posterUrl;
  String backdropUrl;
  String overview;
  Set<int> genreIds;

  TvShowModel({
    this.id,
    this.name,
    this.voteAverage,
    this.firstAirDate,
    this.posterUrl,
    this.backdropUrl,
    this.overview,
    this.genreIds,
  }) : super();
}
