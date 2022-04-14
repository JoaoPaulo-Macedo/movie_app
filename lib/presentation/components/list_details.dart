import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/created_by.dart';

class ListDetails extends StatelessWidget {
  const ListDetails({
    Key? key,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.function,
  }) : super(key: key);

  final String title;
  final String description;
  final CreatedByEntity createdBy;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // const horizontalPadding = 5.0;

    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Text(description, style: textTheme.subtitle1),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'List created by ${createdBy.name}',
                  style: textTheme.caption,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: horizontalPadding),
              child: Text(
                'Movies',
                style: textTheme.headline6,
              ),
            ),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                child: const Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Icon(Icons.replay_outlined, size: 15),
                ),
                onTap: function,
              ),
            ),
          ],
        ), */
      ],
    );
  }
}
