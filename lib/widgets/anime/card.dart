import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final Map<String, dynamic> anime;

  AnimeCard({required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ID: ${anime['id']}, Название: ${anime['names']['ru']}");
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0.8),
                topRight: Radius.circular(0.8),
                bottomLeft: Radius.circular(0.8),
                bottomRight: Radius.circular(0.8),
              ),
              child: Image.network(
                "https://static-libria.weekstorm.one${anime['posters']['original']['url']}",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                anime['names']['ru'] ?? "Без названия",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
