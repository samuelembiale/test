import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff111B2E),
      ),
      home: HomePage(),
    );
  }
}
