class DetailModel<T> {
  int category;
  bool isFavorite;
  T data;

  DetailModel({
    this.category,
    this.isFavorite,
    this.data
  }) : super();
}