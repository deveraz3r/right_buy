import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rightbuy/Widgets/reusable_app_bar.dart';
import 'package:rightbuy/Widgets/reusable_text_feild.dart';

import '../../controller/api_controller.dart';
import '../../models/model.dart';
import '../details screen/details_screen.dart';
import '../../utils/app_colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryController categoryController = Get.put(CategoryController());

  final List<Map<String, String>> brandsData = [
    {'name': 'Barni', 'imagePath': 'assets/images/Barni.png'},
    {'name': 'Cepita', 'imagePath': 'assets/images/Cepita.png'},
    {'name': 'Cerelac', 'imagePath': 'assets/images/Cerelac.png'},
    {'name': 'Dove', 'imagePath': 'assets/images/Dove-Сhocolate-logo.png'},
    {'name': 'Fa', 'imagePath': 'assets/images/Cerelac.png'},
    {'name': 'Barni', 'imagePath': 'assets/images/Barni.png'},
    {'name': 'Cepita', 'imagePath': 'assets/images/Cepita.png'},
    {'name': 'Cerelac', 'imagePath': 'assets/images/Cerelac.png'},
    {'name': 'Dove', 'imagePath': 'assets/images/Dove-Сhocolate-logo.png'},
    {'name': 'Fa', 'imagePath': 'assets/images/Cerelac.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisCount = isPortrait ? 3 : 6;

    return Scaffold(
      backgroundColor: const Color(0xffCCFFDF),
      appBar: ReusableAppBar(
        titleText: "All Categories",
        enableBack: true,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableTextFeild(hintText: "Categories & Brands"),
            SizedBox(height: Get.height * .025),
            // Text('Categories'.tr,
            //     textAlign: TextAlign.left,
            //     style: GoogleFonts.poppins(
            //         fontWeight: FontWeight.w600, fontSize: 16)),
            // SizedBox(height: Get.height * .01),
            Obx(() {
              // original if condition (categoryController.isCategoryLoading.value)
              var temp = categoryController.isCategoryLoading.value;
              if (false) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: List.generate(brandsData.length, (index) {
                      // final Category category = categoryController.categoryList[index];
                      Map category = brandsData[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => DetailsScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,

                                spreadRadius: 1,

                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Get.width * .24,
                                height: Get.height * .08,
                                child: Image.asset(category['imagePath'], fit: BoxFit.contain,),
                              ),
                              Text(category['name'],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
