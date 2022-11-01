import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/preview.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await availableCameras().then((cameras) => Navigator.push(context,
            MaterialPageRoute(builder: (_) => Camera(cameras: cameras))));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.photo_camera,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('Camera'),
          )
        ],
      ),
    );
  }
}

class Camera extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const Camera({super.key, required this.cameras});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    try {
      await _cameraController.initialize().then((_) {
        debugPrint("camera error $cameraDescription");
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      if (!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewScreen(picture: picture)));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        (_cameraController.value.isInitialized)
            ? CameraPreview(_cameraController)
            : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                color: Colors.black),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  icon: const Icon(Icons.flip_camera_android,
                      color: Colors.white),
                  onPressed: () {
                    setState(
                        () => _isRearCameraSelected = !_isRearCameraSelected);
                    initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                  },
                )),
                Expanded(
                    child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 50,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.circle, color: Colors.white),
                  onPressed: takePicture,
                )),
                const Spacer()
              ],
            ),
          ),
        )
      ])),
    );
  }
}
