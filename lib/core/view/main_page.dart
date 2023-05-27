import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/pages/house_page.dart';
import 'package:frontend/core/view/widgets/buildings_list.dart';

import '../../di.dart';
import 'dart:developer' as dev;

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    ref.read(DI.mainPageController).init(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Spacer(),
        Expanded(
          child: FloatingActionButton(
            onPressed: () {
              ref.read(DI.mainPageController).createTestHouse(ref);
            },
            child: const Text("Добавить здание"),
          ),
        ),
      ]),
      body: const SafeArea(child: BuildingsList()),
    );
  }
}
