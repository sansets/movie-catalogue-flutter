import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_catalogue/ui/detail/detail_page.dart';
import 'package:movie_catalogue/ui/movie/movie_model.dart';
import 'package:movie_catalogue/widget/item_movie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(8),
      crossAxisCount: 4,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return ItemMovie(
          id: movie.id,
          posterUrl: movie.posterUrl,
          title: movie.title,
          rating: movie.voteAverage.toString(),
          onTap: (id) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(
                id: movie.id,
                title: movie.title,
                voteAverage: movie.voteAverage,
                releaseDate: movie.releaseDate,
                posterUrl: movie.posterUrl,
                backdropUrl: movie.backdropUrl,
                overview: movie.overview,
              );
            }));
          },
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }

  final List<MovieModel> movies = List.from([
    MovieModel(
      id: 516486,
      title: 'Greyhound',
      voteAverage: 7.2,
      releaseDate: '2020-07-10',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/AsdB9A2XGalCZVjlyG9tRf03IfW.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/xXBnM6uSTk6qqCf0SRZKXcga9Ba.jpg',
      overview:
      'A first-time captain leads a convoy of allied ships carrying thousands of soldiers across the treacherous waters of the “Black Pit” to the front lines of WW2. With no air cover protection for 5 days, the captain and his convoy must battle the surrounding enemy Nazi U-boats in order to give the allies a chance to win the war.',
      genreIds: Set.from([
        28,
        18,
        10752,
      ]),
    ),
    MovieModel(
      id: 547016,
      title: 'The Old Guard',
      voteAverage: 7.3,
      releaseDate: '2020-07-10',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/cjr4NWURcVN3gW5FlHeabgBHLrY.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/m0ObOaJBerZ3Unc74l471ar8Iiy.jpg',
      overview:
      "Four undying warriors who've secretly protected humanity for centuries become targeted for their mysterious powers just as they discover a new immortal.",
      genreIds: Set.from([
        28,
        14,
      ]),
    ),
    MovieModel(
      id: 49017,
      title: 'Dracula Untold',
      voteAverage: 6.3,
      releaseDate: '2014-10-01',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/m5h3NtZ2ZfryIHl1MvatmANvIqQ.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/f02FFv77Rh62633YEjimv7C6JM3.jpg',
      overview:
      "Vlad Tepes is a great hero, but when he learns the Sultan is preparing for battle and needs to form an army of 1,000 boys, he vows to find a way to protect his family. Vlad turns to dark forces in order to get the power to destroy his enemies and agrees to go from hero to monster as he's turned into the mythological vampire, Dracula.",
      genreIds: Set.from([
        28,
        18,
        14,
        27,
        10752,
      ]),
    ),
    MovieModel(
      id: 419704,
      title: 'Ad Astra',
      voteAverage: 6.1,
      releaseDate: '2019-09-17',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/AeDS2MKGFy6QcjgWbJBde0Ga6Hd.jpg',
      overview:
      'The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.',
      genreIds: Set.from([
        18,
        878,
      ]),
    ),
    MovieModel(
      id: 166428,
      title: 'How to Train Your Dragon: The Hidden World',
      voteAverage: 7.8,
      releaseDate: '2019-01-03',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/xvx4Yhf0DVH8G4LzNISpMfFBDy2.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/lFwykSz3Ykj1Q3JXJURnGUTNf1o.jpg',
      overview:
      "As Hiccup fulfills his dream of creating a peaceful dragon utopia, Toothless’ discovery of an untamed, elusive mate draws the Night Fury away. When danger mounts at home and Hiccup’s reign as village chief is tested, both dragon and rider must make impossible decisions to save their kind.",
      genreIds: Set.from([
        12,
        16,
        10751,
      ]),
    ),
    MovieModel(
      id: 531876,
      title: 'The Outpost',
      voteAverage: 7.1,
      releaseDate: '2020-06-24',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/hPkqY2EMqWUnFEoedukilIUieVG.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/n1RohH2VoK1CdVI2fXvcP19dSlm.jpg',
      overview:
      'A small unit of U.S. soldiers, alone at the remote Combat Outpost Keating, located deep in the valley of three mountains in Afghanistan, battles to defend against an overwhelming force of Taliban fighters in a coordinated attack. The Battle of Kamdesh, as it was known, was the bloodiest American engagement of the Afghan War in 2009 and Bravo Troop 3-61 CAV became one of the most decorated units of the 19-year conflict.',
      genreIds: Set.from([
        28,
        18,
        36,
        10752,
      ]),
    ),
    MovieModel(
      id: 475557,
      title: 'Joker',
      voteAverage: 8.2,
      releaseDate: '2019-10-02',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg',
      overview:
      'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.',
      genreIds: Set.from([
        80,
        18,
        53,
      ]),
    ),
    MovieModel(
      id: 454626,
      title: 'Sonic the Hedgehog',
      voteAverage: 7.5,
      releaseDate: '2020-02-12',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/stmYfCUGd8Iy6kAMBr6AmWqx8Bq.jpg',
      overview:
      'Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world’s speediest hedgehog as he embraces his new home on Earth. In this live-action adventure comedy, Sonic and his new best friend team up to defend the planet from the evil genius Dr. Robotnik and his plans for world domination.',
      genreIds: Set.from([
        28,
        35,
        878,
        10751,
      ]),
    ),
    MovieModel(
      id: 587792,
      title: 'Palm Springs',
      voteAverage: 7.8,
      releaseDate: '2020-01-26',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/yf5IuMW6GHghu39kxA0oFx7Bxmj.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/d7JUXVvjvVCXWs1mlpyO5ESdWdT.jpg',
      overview:
      'When carefree Nyles and reluctant maid of honor Sarah have a chance encounter at a Palm Springs wedding, things get complicated as they are unable to escape the venue, themselves, or each other.',
      genreIds: Set.from([
        35,
        878,
        10749,
      ]),
    ),
    MovieModel(
      id: 299536,
      title: 'Avengers: Infinity War',
      voteAverage: 8.3,
      releaseDate: '2018-04-25',
      posterUrl:
      'https://image.tmdb.org/t/p/w342/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg',
      backdropUrl:
      'https://image.tmdb.org/t/p/w780/lmZFxXgJE3vgrciwuDib0N8CfQo.jpg',
      overview:
      'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.',
      genreIds: Set.from([
        28,
        12,
        878,
      ]),
    ),
  ]);
}
