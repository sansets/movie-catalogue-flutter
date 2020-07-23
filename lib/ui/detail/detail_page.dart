import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/ui/detail/detail_model.dart';
import 'package:movie_catalogue/widget/poster.dart';

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
    this.isFavorite = false,
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
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 256,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: detailModel.backdropUrl,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  detailModel.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: detailModel.isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    detailModel.isFavorite = !detailModel.isFavorite;
                  });
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Poster(
                          posterUrl: detailModel.posterUrl,
                          width: 128,
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
                                      fontSize: 20,
                                      fontFamily: "Montserrat"),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Text(
                                    _getYearString(detailModel.releaseDate)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                    child: Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: Text(
                      detailModel.overview,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  String _getYearString(String dateString) {
    return DateTime.parse(detailModel.releaseDate.toString()).year.toString();
  }
}
