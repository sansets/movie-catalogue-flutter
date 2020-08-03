import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_catalogue/ui/detail/detail_model.dart';
import 'package:movie_catalogue/widget/poster.dart';

class DetailPage<T> extends StatefulWidget {
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String posterUrl;
  final String backdropUrl;
  final String overview;
  final int category;
  final bool isFavorite;
  final T data;

  DetailPage({
    Key key,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.posterUrl,
    @required this.backdropUrl,
    @required this.overview,
    @required this.category,
    this.isFavorite = false,
    @required this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState(
      title: title,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      posterUrl: posterUrl,
      backdropUrl: backdropUrl,
      overview: overview,
      detailModel: DetailModel(
        category: category,
        isFavorite: isFavorite,
        data: data,
      ),
    );
  }
}

class _DetailPageState extends State<DetailPage> {
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String posterUrl;
  final String backdropUrl;
  final String overview;
  final DetailModel detailModel;

  _DetailPageState({
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.posterUrl,
    @required this.backdropUrl,
    @required this.overview,
    this.detailModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          _sliverAppBar(),
          _sliverList(),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 256,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: backdropUrl,
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
            detailModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: detailModel.isFavorite ? Colors.red : Colors.white,
          ),
          onPressed: () {
            setState(() {
              detailModel.isFavorite = !detailModel.isFavorite;
            });
          },
        ),
      ],
    );
  }

  SliverList _sliverList() {
    return SliverList(
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
                  _posterWidget(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          title: _titleWidget(),
                          subtitle: _subtitleWidget(),
                        ),
                        _releaseDateWidget(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _overviewTitleWidget(),
            _overviewValueWidget(),
          ],
        ),
      ]),
    );
  }

  Poster _posterWidget() {
    return Poster(
      posterUrl: posterUrl,
      width: 128,
    );
  }

  Text _titleWidget() {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: "Montserrat"),
    );
  }

  Wrap _subtitleWidget() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Icon(
          Icons.star,
          color: Colors.blue,
          size: 16,
        ),
        Text(voteAverage.toString()),
      ],
    );
  }

  Padding _releaseDateWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Text(_getYearString(releaseDate)),
    );
  }

  Padding _overviewTitleWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        "Overview",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _overviewValueWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Text(
        overview,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
      ),
    );
  }

  String _getYearString(String dateString) {
    return DateTime.parse(dateString.toString()).year.toString();
  }
}
