import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/ui/detail/detail_model.dart';

class DetailPage extends StatefulWidget {
  final int id;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String posterUrl;
  final String backdropUrl;
  final String overview;
  final bool isFavorite;
  final Set<int> genreIds;

  DetailPage({
    Key key,
    @required this.id,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.posterUrl,
    @required this.backdropUrl,
    @required this.overview,
    this.isFavorite,
    this.genreIds,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState(
      detailModel: DetailModel(
        id: id,
        title: title,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        posterUrl: posterUrl,
        backdropUrl: backdropUrl,
        overview: overview,
        isFavorite: isFavorite,
        genreIds: genreIds,
      ),
    );
  }
}

class _DetailPageState extends State<DetailPage> {
  final DetailModel detailModel;

  _DetailPageState({this.detailModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: detailModel.backdropUrl,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: detailModel.posterUrl,
                      width: 128,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: Text(
                            detailModel.title,
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
                              Text(detailModel.voteAverage.toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(_getYearString(detailModel.releaseDate)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 16,
              ),
              child: Text("Overview"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Text(detailModel.overview),
            )
          ],
        ),
      ),
    );
  }

  String _getYearString(String dateString) {
    return DateTime.parse(detailModel.releaseDate.toString()).year.toString();
  }
}
