import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ItemMovie extends StatefulWidget {
  final int id;
  final String posterUrl;
  final String movieTitle;
  final String rating;
  final ItemMovieCallback onTap;

  ItemMovie({
    Key key,
    this.id,
    this.posterUrl,
    this.movieTitle,
    this.rating,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemMovieState(
        id: id,
        posterUrl: posterUrl,
        movieTitle: movieTitle,
        rating: rating,
        onTap: onTap,
      );
}

class _ItemMovieState extends State<ItemMovie> {
  final int id;
  final String posterUrl;
  final String movieTitle;
  final String rating;
  final ItemMovieCallback onTap;

  _ItemMovieState({
    this.id,
    this.posterUrl = '',
    this.movieTitle = '',
    this.rating = '',
    this.onTap,
  });

  final BorderRadius _borderRadius = BorderRadius.circular(8);
  final Radius _radius = Radius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius,
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap(id);
          }
        },
        borderRadius: _borderRadius,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: _radius,
                topRight: _radius,
              ),
              child: CachedNetworkImage(
                imageUrl: posterUrl,
              ),
            ),
            ListTile(
              title: Text(
                movieTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                    size: 16,
                  ),
                  Text(rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef ItemMovieCallback = void Function(int id);
