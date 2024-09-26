

import 'package:rightbuy/Widgets/reusable_nav_bar.dart';
import 'package:rightbuy/controller/nav_bar_controller.dart';

import '../../view/camera scanner/camera_scan_screen.dart';
import '../../view/home screen/home_screen.dart';
import '../urls.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  NavBarController _navBarController = Get.put(NavBarController());

  Future<void> _openCameraOrGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(15),
          height: Get.height * .2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Choose Option', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18)),
              SizedBox(height: Get.height * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 0.5), borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, size: 40),
                          onPressed: () async {
                            final cameras = await availableCameras();
                            final firstCamera = cameras.first;

                            Get.back();
                            Get.to(() => CameraScanScreen(camera: firstCamera));
                          },
                        ),
                      ),
                      Text('Camera', style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(width: 0.5), borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                          icon: const Icon(Icons.photo, size: 40),
                          onPressed: () async {
                            final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              Get.back();
                              Get.to(() => ImageDetailsScreen(imagePath: pickedFile.path));
                            }
                          },
                        ),
                      ),
                      Text('Gallery', style: GoogleFonts.poppins(fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx (() => _navBarController.children[_navBarController.selectedIndex.value]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: (){
          _openCameraOrGallery(context);
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 237, 46, 56),
                Color.fromARGB(225, 0, 150, 57)
              ]
            ),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Icon(Icons.qr_code_2_outlined, size: 50, color: Colors.white,),
        ),
      ),
      bottomNavigationBar: ReusableNavBar(),
    );
  }
}



class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(child: Text('Search Page')),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(child: Text('List Page', style: TextStyle(color: Colors.red),)),
    );
  }
}



// FloatingActionButton.large(
// shape: CircleBorder(
// side: BorderSide(
// color: Colors.white,
// width: 2
// )
// ),
// // elevation: 0,
// backgroundColor: Colors.green,
// foregroundColor: Colors.white,
// child: Stack(
// children: [
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(100),
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [
// Color.fromARGB(255, 237, 46, 56),
// Color.fromARGB(225, 0, 150, 57)
// ]
// )
// ),
// // child: Image.asset("assets/urdu.jpg")
// ),
// Center(child: Icon(Icons.camera_alt, size: 50,))
// ],
// ),
// onPressed: (){
// _openCameraOrGallery(context);
// }
// )