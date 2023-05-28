import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../camera/view/pages/house_page.dart';
import '../../../di.dart';
import 'dart:developer' as dev;

class BuildingsList extends ConsumerWidget {
  const BuildingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildings = ref.watch(DI.housePagesChangeNotifier);
    if (buildings.isEmpty()) {
      return Center(
          child: Text(
        "Нет зданий",
        style: Theme.of(context).textTheme.headlineMedium,
      ));
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          title: const Text('История'),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: buildings.length(),
                (_, i) => ListTile(
                      title: Text(buildings.byIndex(i).house.buildingName),
                      subtitle: Text(
                          "${buildings.byIndex(i).house.sectionNumber} секция / ${buildings.byIndex(i).house.slug}"),
                      onTap: () {
                        ref
                            .read(DI.mainPageController)
                            .setHouse(buildings.byIndex(i));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Scaffold(
                                    body: ProviderScope(
                                        parent:
                                            ProviderScope.containerOf(context),
                                        child: const HousePage()))));
                      },
                    ))),
      ],
    );
  }
}
