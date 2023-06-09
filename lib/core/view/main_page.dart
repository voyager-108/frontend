import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/view/house_picking_page.dart';
import 'package:frontend/core/view/widgets/buildings_list.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tflite/tflite.dart';

import '../../di.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    // TODO Remove this test code
    initTorch();
    // TODO
    ref.read(DI.mainPageController).init();
    super.initState();
  }

  // TODO Remove this test function
  Future<void> initTorch() async {
    // final model = await PyTorchMobile.loadModel('assets/yolo.torchscript');
    // final prediction = await model.getImagePrediction(
    //     File("assets/apples.png"), 640, 640, "assets/labels.csv");
    // dev.log(prediction);

    // final imageBytes = await rootBundle.load("assets/apples.png");
    // final model = await PytorchLite.loadObjectDetectionModel(
    //     "assets/yolo_opt.torchscript", 23, 640, 640);
    // final prediction =
    //     await model.getImagePrediction(imageBytes.buffer.asUint8List());
    //
    // dev.log("Prediction Length: ${prediction.length}");
    // for (var e in prediction) {
    //   dev.log("${e?.className} - ${e?.score}");

    // final imageBytes = await rootBundle.load("assets/apples.png");
    // final input = convertTo3DArray(imageBytes.buffer.asUint8List(), 640, 640);
    // // print("RESULT $input");
    //
    // final interpreter =
    //     await tfl.Interpreter.fromAsset('assets/yolo_float32.tflite');
    // final output = [List.filled(27, List.filled(8400, 0.0))];
    // interpreter.run(input, output);
    // writeFile("$output", "output");
    final model = await Tflite.loadModel(
        model: "assets/best_float32.tflite", labels: "assets/labels.txt");
    final recognitions = await Tflite.runModelOnImage(
        path: 'assets/apples.png', // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    print("recognitions".toUpperCase());
    print(recognitions);
    await Tflite.close();
  }

  List<List<List<List<int>>>> convertTo3DArray(
      Uint8List uint8List, int width, int height) {
    final result = List.generate(
        width, (_) => List.generate(height, (_) => List.filled(3, 0)));

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        int index = (i * height + j) * 3;
        result[i][j][0] = uint8List[index];
        result[i][j][1] = uint8List[index + 1];
        result[i][j][2] = uint8List[index + 2];
      }
    }

    return [result];
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
