import 'dart:io';

import 'package:rightbuy/Widgets/reusable_app_bar.dart';

import '../../resources/add_product_widget.dart';
import '../../resources/urls.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController alternativeProductController =
  TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? imagePath;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ReusableAppBar(
        titleText: "Add Item Details",
        centerTitle: true,
        enableBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your support matters. \n'
                    'Add a product to the boycott',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: Get.height * .01),
              AddProductWidget(
                hintText: 'product or brand name',
                controller: productNameController,
              ),
              SizedBox(height: Get.height * .01),
              AddProductWidget(
                hintText: 'Alternative',
                controller: alternativeProductController,
              ),
              SizedBox(height: Get.height * .01),
              AddProductWidget(
                hintText: 'email',
                controller: emailController,
              ),
              SizedBox(height: Get.height * .01),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Rounded border
                ),
                child: const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter details about the boycotted product',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: pickImage,
                      icon: const Icon(Icons.attach_file, color: Colors.white),
                      label: Text('Attach Image',
                          style: GoogleFonts.poppins(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(Get.width * .2, Get.height * .05),
                        // Button size
                        backgroundColor: primaryColor,
                      ),
                    ),
                    SizedBox(width: Get.width * .02),
                    if (imagePath != null)
                      Container(
                        width: Get.width * .2,
                        height: Get.height * .1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: FileImage(File(imagePath!)),
                              fit: BoxFit.cover),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * .01),
              SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      onPressed: () => {},
                      child: Text('Submit Data',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500))))
            ],
          ),
        ),
      ),
    );
  }
}