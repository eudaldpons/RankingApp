import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AppStyles {
  static Color secondaryBackgroundColor = const Color.fromARGB(79, 97, 97, 100);
  static Color primaryColor = const Color.fromARGB(255, 41, 47, 50);
  static Color secondaryColor = const Color.fromARGB(255, 143, 155, 118);
  static TextStyle title = const TextStyle(
    fontSize: 65,
    height: 0.95,
  );

  static TextStyle titleSecondaryColor = const TextStyle(
    color: Color.fromRGBO(143, 155, 118, 100),
    fontSize: 65,
    height: 0.95,
  );

  static TextStyle appBarTitle = const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static MarkdownStyleSheet responseTheme = MarkdownStyleSheet(
      p: const TextStyle(
        fontSize: 18,
      ),
      a: const TextStyle(
        fontSize: 18,
      ),
      h1: const TextStyle(
        fontSize: 24,
      ),
      h2: const TextStyle(
        fontSize: 22,
      ),
      h3: const TextStyle(
        fontSize: 20,
      ),
      h4: const TextStyle(
        fontSize: 18,
      ));

  static TextStyle textFormField = const TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  static InputDecoration searchTextFormField = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    filled: true,
    suffixIcon: const Icon(Icons.search, color: Colors.black),
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
    hintText: 'Search for anything',
  );

  static TextStyle titleWidgetExample = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle questionWidgetExample = const TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  static TextStyle section = const TextStyle(
    fontSize: 28,
  );
}
