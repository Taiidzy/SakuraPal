import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../widgets/anime/card.dart';

class MainScreen extends StatelessWidget {
  final List<dynamic> animeSchedule;

  MainScreen({required this.animeSchedule});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> animeList = _buildAnimeList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание аниме'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSearch02, color: Colors.black, size: 22.0),
            onPressed: () {
              log('Нажата иконка поиска');
            },
          ),
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedFilter, color: Colors.black, size: 22.0),
            onPressed: () {
              log('Нажата иконка фильтра');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final item = animeList[index];
          if (item['type'] == 'header') {
            // Отображение заголовка дня недели
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item['day'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            // Отображение карточки аниме
            return AnimeCard(anime: item['anime']);
          }
        },
      ),
    );
  }

  List<Map<String, dynamic>> _buildAnimeList() {
    final List<Map<String, dynamic>> animeList = [];
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
        // Добавляем заголовок для каждого дня
        animeList.add({'type': 'header', 'day': daysOfWeek[dayIndex]});

        // Добавляем карточки аниме для текущего дня
        animeList.addAll(animeForDay.map((anime) => {'type': 'anime', 'anime': anime}));
      }
    }
    return animeList;
  }
}
