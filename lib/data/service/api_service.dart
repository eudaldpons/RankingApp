import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ranking_app/data/database/database_service.dart';

const _openApiKey = "WRITE-HERE-API-KEY";

class ApiServices {
  static Future<String?> getAnswer({required String msg}) async {
    try {
      var messages = [
        {
          "role": "system",
          "content":
              "Output JSON and answer on the language of the user content. All the answers needs to be a ranking but it is mandatory to enrich them with links, descriptions and/or images relevants to the topic and style it with markdown to improve visualization."
        },
        {"role": "user", "content": msg}
      ];
      var response = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $_openApiKey"
          },
          body: jsonEncode({
            "model": "gpt-4-turbo-preview",
            "messages": messages,
            "max_tokens": 1000,
          }));

      Map jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      String answer = jsonResponse["choices"][0]["message"]["content"];

      DatabaseService().addQuestion(msg, answer);
      return answer;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
