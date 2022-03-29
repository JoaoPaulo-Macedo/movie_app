import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movies_list.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/services/dio_service_imp.dart';
import 'package:movie_app/utils/api_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () => _controller.fetch(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ValueListenableBuilder<MoviesList?>(
          valueListenable: _controller.movieList,
          builder: (_, list, __) {
            if (list == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(list.name, style: const TextStyle(fontSize: 25))),
                const SizedBox(height: 10),
                Text(list.description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'List created by ${list.createdBy.name}',
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text('Movies', style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.results.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 106,
                        padding: const EdgeInsets.fromLTRB(7, 3, 2, 3),
                        color: index % 2 != 0
                            ? Colors.white.withOpacity(0.05)
                            : Colors.white.withOpacity(0.005),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              API.requestImg(list.results[index].posterPath),
                              height: 100,
                              width: 68,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 5, 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list.results[index].title,
                                      style: const TextStyle(fontSize: 17),
                                      overflow: TextOverflow.clip,
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const SizedBox(),
                                        const Spacer(),
                                        Text(
                                          list.results[index].voteCount.toString(),
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          list.results[index].voteAverage.toString(),
                                        ),
                                        const Icon(Icons.star, size: 13),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
