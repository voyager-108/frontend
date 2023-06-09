import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../camera/view/pages/house_page.dart';
import '../../../di.dart';

class HousePickingList extends ConsumerStatefulWidget {
  const HousePickingList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HousePickingListState();
}

class _HousePickingListState extends ConsumerState {
  @override
  void initState() {
    ref
        .read(DI.housePickingPageControllerProvider)
        .getOptions(ref.read(DI.locationHistoryProvider).getLocation()!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final options = ref.watch(DI.availableHousesList);
    if (options == null) {
      return const Center(
        child: Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Подгружаем ближайшие объекты",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    if (options.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            textAlign: TextAlign.center,
            "По этой локации не нашлось зданий",
            style: Theme.of(context).textTheme.headlineMedium,
          )),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Здания'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: options
              .map((e) => ListTile(
                    title: Text(e.buildingName),
                    subtitle: Text("${e.sectionNumber} секция"),
                    onTap: () {
                      ref
                          .read(DI.housePickingPageControllerProvider)
                          .openHouse(e);
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Scaffold(
                                  body: ProviderScope(
                                      parent:
                                          ProviderScope.containerOf(context),
                                      child: const HousePage()))));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
