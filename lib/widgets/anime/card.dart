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
        child: Row(
          children: [
            Image.network(
              "https://static-libria.weekstorm.one${anime['posters']['original']['url']}",
              height: 100,
              width: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anime['names']['ru'] ?? "Без названия",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("ID: ${anime['id']}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
