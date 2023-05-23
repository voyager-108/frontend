import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/pages/progress_page.dart';
import 'package:frontend/camera/view/widgets/floor_title.dart';
import 'camera/view/pages/house_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProviderScope(child: Scaffold(body: HousePage())),
    );
  }
}
