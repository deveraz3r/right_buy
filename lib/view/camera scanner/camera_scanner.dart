
import '../../resources/urls.dart';



class CameraScanScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScanScreen({required this.camera, super.key});

  @override
  CameraScanScreenState createState() => CameraScanScreenState();
}

class CameraScanScreenState extends State<CameraScanScreen>
    with SingleTickerProviderStateMixin {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      Get.to(() => ImageDetailsScreen(imagePath: image.path));
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: backgroundColor, title: const Text('Scan Product')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Positioned(
                              top: _animationController.value *
                                  (MediaQuery.of(context).size.height * 0.5 - 4),
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 4,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      onPressed: _captureImage,
                      icon: Icon(Icons.camera_alt),
                      iconSize: 64,
                      color: Colors.blue,
                      padding: EdgeInsets.all(16),
                      constraints: BoxConstraints(),
                      splashColor: Colors.blue,
                      splashRadius: 32,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}