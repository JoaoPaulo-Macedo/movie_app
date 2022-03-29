import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_list.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/services/dio_service_imp.dart';

import '../components/list_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return ValueListenableBuilder<MoviesList?>(
      valueListenable: _controller.movieList,
      builder: (_, list, __) {
        if (list == null) {
          return Center(child: Lottie.asset('assets/lottie.json', height: 250));
        }
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, topPadding, 20, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                ListDetails(
                  title: list.name,
                  description: list.description,
                  createdBy: list.createdBy,
                  function: () => _controller.fetch(),
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
