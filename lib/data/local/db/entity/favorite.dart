class Favorite<T> {
  int id;
  int category;
  T data;

  Favorite({
    this.id,
    this.category,
    this.data
  }) : super();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'data': data,
    };
  }
}