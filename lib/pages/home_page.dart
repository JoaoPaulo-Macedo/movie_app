import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_list.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/services/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final topPadding = MediaQuery.of(context).padding.top + 10;

    return ValueListenableBuilder<MoviesList?>(
      valueListenable: _controller.movieList,
      builder: (_, list, __) {
        if (list == null) {
          return Center(child: Lottie.asset('assets/lottie.json', height: 250));
        }

        /* 
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () => _controller.fetch(),
          ), 
        */
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, topPadding, 20, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    list.name,
                    style: textTheme.headline4?.copyWith(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                Text(list.description, style: textTheme.subtitle1),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'List created by ${list.createdBy.name}',
                    style: textTheme.caption,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Movies',
                        style: textTheme.headline4?.copyWith(fontSize: 22),
                      ),
                      Center(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.replay_outlined, size: 15),
                          ),
                          onTap: () => _controller.fetch(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    itemCount: list.movies.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, index) {
                      return MovieCard(movie: list.movies[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
