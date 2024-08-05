import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  late CameraDescription firstCamera;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    firstCamera = cameras!.first;
    controller = CameraController(firstCamera, ResolutionPreset.high);
    await controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(controller!),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () async {
                  try {
                    final image = await controller!.takePicture();
                    final path = join(
                      (await getTemporaryDirectory()).path,
                      '${DateTime.now()}.png',
                    );
                    image.saveTo(path);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Picture saved to $path')),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                child: Icon(Icons.camera_alt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
