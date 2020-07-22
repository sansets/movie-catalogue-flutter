import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_catalogue/widget/poster.dart';

class ItemMovie extends StatelessWidget {
  final int id;
  final String posterUrl;
  final String title;
  final String rating;
  final ItemMovieCallback onTap;

  ItemMovie({
    Key key,
    @required this.id,
    @required this.posterUrl,
    @required this.title,
    @required this.rating,
    this.onTap,
  }) : super(key: key);

  final BorderRadius _borderRadius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2.0,
            offset: new Offset(0.0, 2.0),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: _borderRadius,
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
              Poster(posterUrl: posterUrl),
              ListTile(
                title: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat'
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
      ),
    );
  }
}

typedef ItemMovieCallback = void Function(int id);
