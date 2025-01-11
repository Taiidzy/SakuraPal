import 'package:flutter/material.dart';

import '../widgets/anime/card.dart';

class MainScreen extends StatelessWidget {
  final List<dynamic> animeSchedule;

  MainScreen({required this.animeSchedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание аниме'),
      ),
      body: ListView(
        children: _buildAnimeSchedule(),
      ),
    );
  }

  List<Widget> _buildAnimeSchedule() {
    List<Widget> daySections = [];
    final daysOfWeek = [
      "Понедельник",
      "Вторник",
      "Среда",
      "Четверг",
      "Пятница",
      "Суббота",
      "Воскресенье"
    ];

    for (var schedule in animeSchedule) {
      int dayIndex = schedule['day'];
      List<dynamic> animeForDay = schedule['list'];

      if (animeForDay.isNotEmpty) {
        daySections.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            daysOfWeek[dayIndex],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
        daySections.addAll(animeForDay.map((anime) => AnimeCard(anime: anime)));
      }
    }
    return daySections;
  }
}
