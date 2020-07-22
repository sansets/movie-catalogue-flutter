import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_catalogue/ui/detail/detail_page.dart';
import 'package:movie_catalogue/ui/tv_show/tv_show_model.dart';
import 'package:movie_catalogue/widget/app_bar_default.dart';
import 'package:movie_catalogue/widget/item_movie.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarDefault(title: 'TV Shows'),
      body: StaggeredGridView.countBuilder(
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
                );
              }));
            },
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }

  final List<TvShowModel> tvShows = List.from([
    TvShowModel(
      id: 2734,
      name: 'Law & Order: Special Victims Unit',
      voteAverage: 7.2,
      firstAirDate: '1999-09-20',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/6t6r1VGQTTQecN4V0sZeqsmdU9g.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/cD9PxbrdWYgL7MUpD9eOYuiSe2P.jpg',
      overview:
          'In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.',
      genreIds: Set.from([
        80,
        18,
      ]),
    ),
    TvShowModel(
      id: 1622,
      name: 'Supernatural',
      voteAverage: 7.9,
      firstAirDate: '2005-09-13',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/nVRyd8hlg0ZLxBn9RaI7mUMQLnz.jpg',
      overview:
          "When they were boys, Sam and Dean Winchester lost their mother to a mysterious and demonic supernatural force. Subsequently, their father raised them to be soldiers. He taught them about the paranormal evil that lives in the dark corners and on the back roads of America ... and he taught them how to kill it. Now, the Winchester brothers crisscross the country in their '67 Chevy Impala, battling every kind of supernatural threat they encounter along the way.",
      genreIds: Set.from([
        18,
        9648,
        10765,
      ]),
    ),
    TvShowModel(
      id: 1668,
      name: 'Friends',
      voteAverage: 8.2,
      firstAirDate: '1994-09-22',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/f496cm9enuEsZkSPzCwnTESEK5s.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg',
      overview:
          'The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.',
      genreIds: Set.from([
        35,
        18,
      ]),
    ),
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
      id: 1434,
      name: 'Family Guy',
      voteAverage: 6.7,
      firstAirDate: '1999-01-31',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/q3E71oY6qgAEiw6YZIHDlHSLwer.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/4oE4vT4q0AD2cX3wcMBVzCsME8G.jpg',
      overview:
          "Sick, twisted, politically incorrect and Freakin' Sweet animated series featuring the adventures of the dysfunctional Griffin family. Bumbling Peter and long-suffering Lois have three kids. Stewie (a brilliant but sadistic baby bent on killing his mother and taking over the world), Meg (the oldest, and is the most unpopular girl in town) and Chris (the middle kid, he's not very bright but has a passion for movies). The final member of the family is Brian - a talking dog and much more than a pet, he keeps Stewie in check whilst sipping Martinis and sorting through his own life issues.",
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
      id: 549,
      name: 'Law & Order',
      voteAverage: 7.5,
      firstAirDate: '1990-09-13',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/jUKiOgSYVAP8ARYPotgnBwIK1x7.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/A4kt2TAsV8bq0csfwJbfgiZtG4g.jpg',
      overview:
          'Law & Order is an American police procedural and legal drama television series, created by Dick Wolf and part of the Law & Order franchise. It originally aired on NBC and, in syndication, on various cable networks. Law & Order premiered on September 13, 1990, and completed its 20th and final season on May 24, 2010. At the time of its cancellation, Law & Order was the longest-running crime drama on American primetime television. After The Simpsons, both Law & Order and Gunsmoke tied for the second longest-running scripted American primetime series with ongoing characters.',
      genreIds: Set.from([
        18,
        80,
        9648,
      ]),
    ),
    TvShowModel(
      id: 70523,
      name: 'Dark',
      voteAverage: 8.5,
      firstAirDate: '2017-12-01',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/apbrbWs8M9lyOpJYU5WXrpFbk1Z.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/3lBDg3i6nn5R2NKFCJ6oKyUo2j5.jpg',
      overview:
          'A missing child causes four families to help each other for answers. What they could not imagine is that this mystery would be connected to innumerable other secrets of the small town.',
      genreIds: Set.from([
        80,
        18,
        9648,
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
    TvShowModel(
      id: 1412,
      name: 'Arrow',
      voteAverage: 6.3,
      firstAirDate: '2012-10-10',
      posterUrl:
          'https://image.tmdb.org/t/p/w342/gKG5QGz5Ngf8fgWpBsWtlg5L2SF.jpg',
      backdropUrl:
          'https://image.tmdb.org/t/p/w780/fFT7T9y9NVRdcdVh81roVrJBcDh.jpg',
      overview:
          'Spoiled billionaire playboy Oliver Queen is missing and presumed dead when his yacht is lost at sea. He returns five years later a changed man, determined to clean up the city as a hooded vigilante armed with a bow.',
      genreIds: Set.from([
        80,
        18,
        9648,
        10759,
      ]),
    ),
  ]);
}
