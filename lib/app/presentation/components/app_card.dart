import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';

class AppCard extends StatelessWidget {
  const AppCard._({Key? key, required this.onTap, this.list, this.movie})
      : super(key: key);

  factory AppCard.list(ListIdentifierEntity list, Function onTap) {
    return AppCard._(list: list, onTap: onTap);
  }

  factory AppCard.movie(MovieEntity movie, Function onTap) {
    return AppCard._(movie: movie, onTap: onTap);
  }

  final ListIdentifierEntity? list;
  final MovieEntity? movie;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final num? voteAverage = list != null ? list?.averageRating : movie?.voteAverage;
    final String title = list != null ? list!.name : movie!.title;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            //TODO: ask how to solve it
            onTap: () =>
                list != null ? onTap(context, list!.id) : onTap(context, movie),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (list != null)
                  AppPoster.list(list?.posterPath ?? '')
                else
                  AppPoster.movie(movieId: movie!.id, posterPath: movie?.posterPath),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          style: textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (movie != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Center(
                                  child: Text(
                                    movie!.voteCount.toString(),
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            Row(
                              children: [
                                Text(
                                  voteAverage?.toStringAsFixed(2) ?? '',
                                ),
                                const SizedBox(width: 3),
                                const Icon(Icons.star, size: 13),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
