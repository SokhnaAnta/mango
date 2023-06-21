import 'package:tflite/tflite.dart';

loadModel() async {
  await Tflite.loadModel(
    model:
        "assets/Leafmodel/model_unquant.tflite", //  assets/Leafmodel/anthracnose_model.tflite
    labels: "assets/Leafmodel/labels.txt",
    numThreads: 1,
  );
}

classifyImage(String path) async {
  List? output = await Tflite.runModelOnImage(
      path: path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 5,
      threshold: 0.2,
      asynch: true);
  return output;
}
