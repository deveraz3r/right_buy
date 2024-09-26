import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/api_controller.dart';
import '../../models/model.dart';
import '../details screen/details_screen.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisCount = isPortrait ? 3 : 6;

    return Scaffold(
      backgroundColor: const Color(0xffCCFFDF),
      appBar: AppBar(
        backgroundColor: const Color(0xffCCFFDF),
        centerTitle: true,
        title: Text('All Brands',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Categories & Brands',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
            SizedBox(height: Get.height * .03),
            Text('Brands',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 16)),
            SizedBox(height: Get.height * .01),
            Obx(() {
              if (categoryController.isBrandsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: List.generate(categoryController.brandsList.length, (index) {
                      final Brands brand = categoryController.brandsList[index];
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
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: Get.width * .24,
                                height: Get.height * .08,
                                child: Image.network(brand.brandImage),
                              ),
                              Text(brand.name,
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
