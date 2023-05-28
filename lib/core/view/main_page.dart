import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/view/house_picking_page.dart';
import 'package:frontend/core/view/widgets/buildings_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../di.dart';

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
              showCupertinoModalBottomSheet(
                  expand: false,
                  bounce: true,
                  context: context,
                  builder: (c) => ProviderScope(
                      parent: ProviderScope.containerOf(context),
                      child: const HousePickingPage()));
            },
            child: const Text("Добавить здание"),
          ),
        ),
      ]),
      body: const SafeArea(child: BuildingsList()),
    );
  }
}
