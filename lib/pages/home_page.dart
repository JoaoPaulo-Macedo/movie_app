import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
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
                Text(
                  'List created by ${list.createdBy.name}',
                  style: const TextStyle(fontSize: 11),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text('Movies', style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  itemCount: list.results.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  // separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(7, 3, 2, 3),
                      color: index % 2 != 0
                          ? Colors.white.withOpacity(0.05)
                          : Colors.white.withOpacity(0.005),
                      child: Text(
                        list.results[index].title,
                        style: const TextStyle(fontSize: 17),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
