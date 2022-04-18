import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/components/movie_poster.dart';

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      API.requestImg(list!.posterPath),
                      width: 150,
                      errorBuilder: (_, __, ___) {
                        return const SizedBox(
                          width: 93.5,
                          child: Center(
                            child: Icon(Icons.error_outline,
                                color: Colors.red, size: 40),
                          ),
                        );
                      },
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;

                        return const SizedBox(
                          width: 93.5,
                          child: Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  )
                else
                  MoviePoster(movieId: movie!.id, posterPath: movie!.posterPath),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Text(
                          list != null ? list!.name : movie!.title,
                          style: textTheme.headline6,
                          overflow: TextOverflow.clip,
                        ), */
                        const Spacer(),
                        if (movie != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: Text(
                                  movie!.voteCount.toString(),
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                movie!.voteAverage.toString(),
                              ),
                              const Icon(Icons.star, size: 13),
                            ],
                          )
                        else
                          const SizedBox(),
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
