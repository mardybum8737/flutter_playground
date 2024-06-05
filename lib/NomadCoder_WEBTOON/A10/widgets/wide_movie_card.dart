import 'package:flutter/material.dart';

class WideMovieCard extends StatelessWidget {
  const WideMovieCard({super.key, required this.thumb, required this.onTab});
  final String thumb;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
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
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/$thumb',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
