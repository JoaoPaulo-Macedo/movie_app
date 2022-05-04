import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';

class ListCard extends StatelessWidget {
  const ListCard(this.list, this.onTap, {Key? key}) : super(key: key);

  final ListEntity list;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTap(context, list.id),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPoster.list(list.posterPath ?? ''),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list.name,
                          maxLines: 3,
                          style: GoogleFonts.lora(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  list.averageRating?.toStringAsFixed(2) ?? '',
                                  style: const TextStyle(fontSize: 11),
                                ),
                                const SizedBox(width: 3),
                                const Icon(Icons.star, size: 10),
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

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, this.onTap, {Key? key}) : super(key: key);

  final MovieEntity? movie;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Positioned.fill(
            child: AppPoster.movie(movieId: movie!.id, posterPath: movie?.posterPath),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                //TODO: ask how to solve it
                onTap: () => onTap(context, movie),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
