import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/presentation/components/list_details.dart';
import 'package:movie_app/presentation/components/movie_card.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  final textController = TextEditingController();
  final searchFocus = FocusNode();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    controller = GetIt.instance.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    Widget pageController = Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.arrow_left, size: 25),
          onTap: () => setState(() => controller.backPage()),
        ),
        const SizedBox(width: 15),
        Text(controller.page.toString(), style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 15),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.arrow_right, size: 25),
          onTap: () => setState(() => controller.advancePage()),
        ),
      ],
    );

    return ValueListenableBuilder<MoviesListEntity?>(
      valueListenable: controller.moviesList,
      builder: (_, list, __) {
        if (list == null) {
          return Center(child: Lottie.asset('assets/lottie.json', height: 250));
        }

        return GestureDetector(
          onTap: () {
            setState(() {
              searchFocus.unfocus();
              if (textController.text.isEmpty) isSearching = false;
            });
          },
          child: Scaffold(
            appBar: AppBar(
              leading: Visibility(
                visible: !isSearching,
                child: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              ),
              actions: [
                Visibility(
                  visible: isSearching,
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: textController,
                        focusNode: searchFocus,
                        cursorColor: Colors.white,
                        textCapitalization: TextCapitalization.words,
                        maxLength: 20,
                        buildCounter: null,
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          counterText: '',
                          contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => setState(() {
                              textController.clear();
                              controller.onChanged('');
                              isSearching = false;
                            }),
                          ),
                        ),
                        onChanged: controller.onChanged,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isSearching,
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => setState(() {
                      isSearching = true;
                      searchFocus.requestFocus();
                    }),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListDetails(
                    title: list.name,
                    description: list.description,
                    createdBy: list.createdBy,
                    pageController: pageController,
                    function: () => controller.fetch(),
                  ),
                  const SizedBox(height: 15),
                  controller.isLoading
                      ? const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: list.movies.length,
                            padding: EdgeInsets.zero,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (_, index) {
                              if (list == null) return CircularProgressIndicator();
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
