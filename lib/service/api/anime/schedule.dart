import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Schedule {
  static Future<List<dynamic>?> fetchAnimeSchedule() async {
    try {
      final response = await http
          .get(Uri.parse(
              'https://api.anilibria.tv/v3/title/schedule?filter=posters,type,status,id,code,names,season'))
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null; // Ошибка ответа
      }
    } on TimeoutException catch (_) {
      return null; // Таймаут запроса
    } catch (e) {
      log("Ошибка API: $e", name: "fetchAnimeSchedule", time: DateTime.now());
      return null;
    }
  }
}