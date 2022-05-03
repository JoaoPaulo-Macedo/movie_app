import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/pages/movie/components/movie_actions.dart';
import 'package:movie_app/app/presentation/pages/movie/components/movie_details.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/components/movie_poster.dart';

class MoviePage extends StatefulWidget {
  const MoviePage(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late MovieController controller;

  @override
  void initState() {
    super.initState();

    controller = MovieController(
      context,
      GetIt.instance.get<FavoriteMoviesListUseCase>(),
      widget.movie,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MoviePoster(widget.movie),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: window.physicalSize.height / 3.3),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: MovieDetails(widget.movie),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MovieActions(controller: controller),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
