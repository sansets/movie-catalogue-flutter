import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_catalogue/ui/detail/detail_page.dart';
import 'package:movie_catalogue/ui/movie/movie_model.dart';
import 'package:movie_catalogue/ui/tv_show/tv_show_model.dart';
import 'package:movie_catalogue/widget/app_bar_default.dart';
import 'package:movie_catalogue/widget/item_movie.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarDefault(
          title: 'Favorites',
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black45,
            labelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(text: 'Movies'),
              Tab(text: 'TV Shows'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _MovieTab(),
            _TvShowTab(),
          ],
        ),
      ),
    );
  }
}

class _MovieTab extends StatelessWidget {
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
                isFavorite: true,
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
  ]);
}

class _TvShowTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: tvShows.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final tvShow = tvShows[index];

        return ItemMovie(
          id: tvShow.id,
          posterUrl: tvShow.posterUrl,
          title: tvShow.name,
          rating: tvShow.voteAverage.toString(),
          onTap: (id) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPage(
                id: tvShow.id,
                title: tvShow.name,
                voteAverage: tvShow.voteAverage,
                releaseDate: tvShow.firstAirDate,
                posterUrl: tvShow.posterUrl,
                backdropUrl: tvShow.backdropUrl,
                overview: tvShow.overview,
                isFavorite: true,
              );
            }));
          },
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }

  final List<TvShowModel> tvShows = List.from([
    TvShowModel(
      id: 456,
      name: 'The Simpsons',
      voteAverage: 7.5,
      firstAirDate: '1989-12-17',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/qcr9bBY6MVeLzriKCmJOv1562uY.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/adZ9ldSlkGfLfsHNbh37ZThCcgU.jpg',
      overview:
          'Set in Springfield, the average American town, the show focuses on the antics and everyday adventures of the Simpson family; Homer, Marge, Bart, Lisa and Maggie, as well as a virtual cast of thousands. Since the beginning, the series has been a pop culture icon, attracting hundreds of celebrities to guest star. The show has also made name for itself in its fearless satirical take on politics, media and American life in general.',
      genreIds: Set.from([
        16,
        35,
      ]),
    ),
    TvShowModel(
      id: 1403,
      name: "Marvel's Agents of S.H.I.E.L.D.",
      voteAverage: 7.1,
      firstAirDate: '2013-09-24',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/gHUCCMy1vvj58tzE3dZqeC9SXus.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/mUCV0W6TaAk8UWA5yAmqCywC63F.jpg',
      overview:
          "Agent Phil Coulson of S.H.I.E.L.D. (Strategic Homeland Intervention, Enforcement and Logistics Division) puts together a team of agents to investigate the new, the strange and the unknown around the globe, protecting the ordinary from the extraordinary.",
      genreIds: Set.from([
        18,
        10759,
        10765,
      ]),
    ),
    TvShowModel(
      id: 60735,
      name: 'The Flash',
      voteAverage: 7.4,
      firstAirDate: '2014-10-07',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/wHa6KOJAoNTFLFtp7wguUJKSnju.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/jC1KqsFx8ZyqJyQa2Ohi7xgL7XC.jpg',
      overview:
          "After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only \"meta-human\" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.",
      genreIds: Set.from([
        18,
        10765,
      ]),
    ),
  ]);
}
