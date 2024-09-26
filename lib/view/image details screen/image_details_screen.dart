import 'dart:io';

import '../../resources/urls.dart';



class ImageDetailsScreen extends StatefulWidget {
  final String imagePath;

  const ImageDetailsScreen({required this.imagePath, super.key});

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * .2),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height * .6,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(children: [
                    SizedBox(height: Get.height * .09),
                    Container(
                      width: Get.width * .6,
                      height: Get.height * .07,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Image.asset(ImageAssets.categoriesImage8)),
                            Container(
                                child: Image.asset(ImageAssets.equalIcon)),
                            Text('Pepsico',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Text('The Product is on the boycott list',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor)),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: Get.width,
                      decoration: const BoxDecoration(color: Colors.black12),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('7UP ', style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.bold)),
                              Text('is owned by ', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                              Text('Pepsico',style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.bold))
                            ]),
                        SizedBox(height: Get.height*.01),
                        Text("Pepsico bought SodaStream for 3.bn and owns 50% of Sabra both of which had taken advantage of the Israel occupation of Palestine", textAlign: TextAlign.center, style: GoogleFonts.poppins()),
                        SizedBox(height: Get.height*.01),
                        Container(
                          height: Get.height*.06,
                          width: Get.width * .5,
                          decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text('Open Proof', style: GoogleFonts.poppins())),
                        )
                      ]),
                    ),
                    SizedBox(height: Get.height*.01),
                    Text('Your Voice is Powerful', style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.bold)),
                    Text('Your Share could help more people make an ethical choice', textAlign: TextAlign.center, style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.bold)),
                    SizedBox(height: Get.height*.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ShareIconWidget(imageAddress: ImageAssets.facebookIcon, onPressed: (){}),
                        ShareIconWidget(imageAddress: ImageAssets.twitterIcon, onPressed: (){}),
                        ShareIconWidget(imageAddress: ImageAssets.instagramIcon, onPressed: (){}),
                        ShareIconWidget(imageAddress: ImageAssets.linkedinIcon, onPressed: (){}),
                        ShareIconWidget(imageAddress: ImageAssets.whatsappIcon, onPressed: (){}),
                      ],
                    )
                  ]),
                ),
                Positioned(
                  top: -55,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: Get.height * .15,
                      width: Get.width * .33,
                      decoration: const BoxDecoration(
                        color: backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: ClipOval(
                          child: Container(
                            height: Get.height * .13,
                            width: Get.width * .24,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.file(
                              File(widget.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShareIconWidget extends StatelessWidget {
  final String imageAddress;
  final VoidCallback onPressed;

  const ShareIconWidget({
    super.key,
    required this.imageAddress,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(child: Image.asset(imageAddress, width: 25, height: 25)),
    );
  }
}