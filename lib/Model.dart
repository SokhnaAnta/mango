import 'package:tflite/tflite.dart';

loadModel() async {
  await Tflite.loadModel(
    model:
        "assets/Leafmodel/anthracnose_model.tflite_.tflite", // "assets/Leafmodel/model_unquant.tflite"
    labels: "assets/Leafmodel/labels.txt",
    numThreads: 1,
  );
}

classifyImage(String path) async {
  List? output = await Tflite.runModelOnImage(
      path: path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true);
  return output;
}
