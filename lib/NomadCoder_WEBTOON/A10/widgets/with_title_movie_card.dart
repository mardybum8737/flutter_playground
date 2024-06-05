import 'package:flutter/material.dart';

class WithTitleMovieCard extends StatelessWidget {
  const WithTitleMovieCard(
      {super.key,
      required this.thumb,
      required this.originalTitle,
      required this.onTab});
  final String thumb;
  final String originalTitle;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTab,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 200,
            width: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$thumb',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            originalTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ]),
      ),
    );
  }
}
