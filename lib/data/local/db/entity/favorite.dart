class Favorite<T> {
  int id;
  T data;

  Favorite({
    this.id,
    this.data
  }) : super();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
    };
  }
}