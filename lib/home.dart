import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedImagePath = '';
  late List _outputs;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.yellow.shade800),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 140,
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Text("Febaru Mango yi",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(width: 50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(.1)),
                child: const IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: _fall,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          const SizedBox(height: 30),
          Center(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedImagePath == ''
                    ? Image.asset(
                        'assets/images/image_placeholder.png',
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        File(selectedImagePath),
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                selectedImagePath == ''
                    ? const Text(
                        'Select Image',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      )
                    : Text(_outputs[0]["label"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 14, color: Colors.white))),
                    onPressed: () async {
                      selectImage();
                      setState(() {});
                    },
                    child: const Text('Select')),
                const SizedBox(height: 10),
              ],
            ),
          )),
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
        ]),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow.shade800,
          onPressed: () {},
          child: const Icon(
            CupertinoIcons.chat_bubble,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 255, 216, 59),
                icon: Icon(CupertinoIcons.cloud_rain),
                label: "weather"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled), label: "weather")
          ]),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            _outputs = await classifyImage(selectedImagePath);
                            // print(_outputs);
                            if (selectedImagePath != '') {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Détection d\'image terminée'),
                                      content: Text(
                                        _outputs[0]["label"],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Fermer le pop-up
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            _outputs = await classifyImage(selectedImagePath);
                            if (selectedImagePath != '') {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              setState(() async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'Détection d\'image terminée'),
                                      content: Text(
                                        _outputs[0]["label"],
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); // Fermer le pop-up
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}

_fall() {
  //print("ok");
}
