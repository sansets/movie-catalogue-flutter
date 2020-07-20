import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Poster extends StatelessWidget {
  final double width;
  final String posterUrl;

  Poster({this.width, this.posterUrl});

  final BorderRadius _borderRadius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: posterUrl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: new Offset(0.0, 8.0),
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: _borderRadius,
            child: _Image(width: width, posterUrl: posterUrl)
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final double width;
  final String posterUrl;

  _Image({this.width, this.posterUrl});

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return CachedNetworkImage(imageUrl: posterUrl, width: width);
    } else {
      return AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(imageUrl: posterUrl),
      );
    }
  }
}
