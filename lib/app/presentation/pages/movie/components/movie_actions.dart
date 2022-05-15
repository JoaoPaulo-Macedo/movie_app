import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_controller.dart';

class MovieActions extends StatelessWidget {
  const MovieActions({Key? key, required this.controller, required this.isFavorite})
      : super(key: key);

  final MovieController controller;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(100),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                child: const Icon(Icons.close, size: 30),
                onTap: () => controller.requestClose(),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  child: Icon(
                    isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    size: 30,
                  ),
                  onTap: controller.togglefavorite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
