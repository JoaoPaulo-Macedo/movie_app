import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/controllers/home_controller.dart';
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
  final _controller = HomeController(MoviesRepositoryImp(DioServiceImp()));
  final _textController = TextEditingController();
  final _searchFocus = FocusNode();
  bool search = false;

  @override
  Widget build(BuildContext context) {
    const verticalPadding = 15.0;
    // final mediaQueryTopPadding = MediaQuery.of(context).padding.top;

    return ValueListenableBuilder<MoviesList?>(
      valueListenable: _controller.moviesList,
      builder: (_, list, __) {
        if (list == null) {
          return Center(child: Lottie.asset('assets/lottie.json', height: 250));
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              _searchFocus.unfocus();
              if (_textController.text.isEmpty) search = false;
            });
          },
          child: Scaffold(
            appBar: AppBar(
              leading: Visibility(
                visible: !search,
                child: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              ),
              actions: [
                Visibility(
                  visible: search,
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: _textController,
                        focusNode: _searchFocus,
                        cursorColor: Colors.white,
                        maxLength: 20,
                        buildCounter: null,
                        style: const TextStyle(fontSize: 17),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          counterText: '',
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => setState(() {
                              _textController.clear();
                              _controller.onChanged('');
                              search = false;
                            }),
                          ),
                        ),
                        onChanged: _controller.onChanged,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !search,
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => setState(() {
                      search = true;
                      _searchFocus.requestFocus();
                    }),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              // padding: EdgeInsets.fromLTRB(
              //   20,
              //   // mediaQueryTopPadding,
              //   verticalPadding,
              //   20,
              //   verticalPadding,
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: verticalPadding),
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
          ),
        );
      },
    );
  }
}
