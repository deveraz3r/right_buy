import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rightbuy/Widgets/reusable_app_bar.dart';
import 'package:rightbuy/Widgets/reusable_text_feild.dart';
import '../../controller/api_controller.dart';
import '../../resources/urls.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, String>> brandProducts = [
    {'name': 'Barni', 'imagePath': 'assets/images/Barni.png'},
    {'name': 'Cepita', 'imagePath': 'assets/images/Cepita.png'},
    {'name': 'Cerelac', 'imagePath': 'assets/images/Cerelac.png'},
    {'name': 'Dove', 'imagePath': 'assets/images/Dove-Сhocolate-logo.png'},
    {'name': 'Fa', 'imagePath': 'assets/images/Cerelac.png'}
  ];

  List<Map> newsData = [
    {
      "image": "assets/default_image.jpg",
      "title": "Peace Talks Resume",
      "subtitle":
          "Negotiations between Palestine and Israel resume in hopes of reaching a peace agreement."
    },
    {
      "image": "assets/boycott_image.jpg",
      "title": "Rebuilding Efforts",
      "subtitle":
          ". . . .  . . .  . . . . . . . . . . . . . . . . . . . . . .  . .. . . .  . . .  . . . . . . . . . . . . . . . . . . . . . .  . .. . . .  . . .  . . . . . . . . . . . . . . . . . . . . . .  . ."
    },
    {
      "image": "assets/urdu.jpg",
      "title": "Humanitarian Aid",
      "subtitle":
          "International organizations send aid to Palestinians affected by recent conflicts."
    },
    {
      "image": "assets/boycott_image.jpg",
      "title": "Protests in Gaza",
      "subtitle":
          "Massive protests erupt in Gaza Strip calling for an end to the blockade."
    },
    {
      "image": "assets/boycott_image.jpg",
      "title": "UN Resolution",
      "subtitle":
          "The United Nations passes a resolution calling for a ceasefire in the region."
    },
    {
      "image": "assets/boycott_image.jpg",
      "title": "Rebuilding Efforts",
      "subtitle":
          "Rebuilding efforts begin in Palestinian territories following recent destruction."
    },
  ];
  List<Map> brandsData = [
    {
      "name": "Fashion",
      "image": "assets/default_image.jpg",
      "subtitle": "Latest trends and collections from top fashion brands."
    },
    {
      "name": "Electronics",
      "image": "assets/boycott_image.jpg",
      "subtitle": "Innovative gadgets and electronics from leading brands."
    },
    {
      "name": "Automotive",
      "image": "assets/urdu.jpg",
      "subtitle": "Top car brands and automotive news."
    },
    {
      "name": "Beauty",
      "image": "assets/default_image.jpg",
      "subtitle": "Beauty products and skincare from premium brands."
    },
    {
      "name": "Home Appliances",
      "image": "assets/boycott_image.jpg",
      "subtitle": "High-quality appliances for your home from trusted brands."
    },
    {
      "name": "Food & Beverage",
      "image": "assets/urdu.jpg",
      "subtitle": "Popular food and beverage brands."
    },
    {
      "name": "Sportswear",
      "image": "assets/default_image.jpg",
      "subtitle": "Leading brands in sportswear and activewear."
    },
    {
      "name": "Luxury",
      "image": "assets/boycott_image.jpg",
      "subtitle": "Exclusive luxury brands and their latest offerings."
    },
    {
      "name": "Furniture",
      "image": "assets/urdu.jpg",
      "subtitle": "Top furniture brands and their collections."
    },
    {
      "name": "Toys",
      "image": "assets/default_image.jpg",
      "subtitle": "Popular toy brands for kids of all ages."
    }
  ];

  final TextEditingController searchController = TextEditingController();
  final CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ReusableAppBar(
        appBarTitle: const Row(
          children: [
            Text(
              "Right",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 5,),
            Text(
              "Buy",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        centerTitle: false,
        titleText: '',
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color.fromARGB(255, 237, 46, 56),
        //       Color.fromARGB(225, 0, 150, 57)
        //     ]
        //   )
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            // Added SingleChildScrollView
            child: Column(
              children: [
                const SizedBox(height: 15),
                ReusableTextFeild(hintText: "Categories & Brands", controller: searchController,),
                const SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Category',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const CategoriesScreen());
                        },
                        child: Icon(Icons.list, color: Colors.grey,),
                      )
                    ]),
                //start Category section
                SizedBox(
                  height: 160,
                  child: Obx(() {
                    if (categoryController.isCategoryLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.categoryList.length,
                        itemBuilder: (context, index) {
                          final category =
                              categoryController.categoryList[index];
                          return Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1)
                                ]),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 4),
                                CircleAvatar(
                                  radius: 30.0,
                                  child: category.categoryImage.isNotEmpty
                                      ? Image.network(category.categoryImage,
                                          fit: BoxFit.fitWidth, height: 90)
                                      : const Icon(Icons.image, size: 50),
                                ),
                                Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                          separatorBuilder: (context, index){
                            return SizedBox(width: 10,);
                          },
                      );
                    }
                  }),
                ),
                //end Category section
                const SizedBox(height: 10),
                // start Popular Products Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    InkWell(
                        onTap: () {
                          Get.to(() => const CategoriesScreen());
                        },
                        child: Icon(Icons.list, color: Colors.grey,),
                    )
                  ],
                ),
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: brandProducts.length,
                    itemBuilder: (context, index) {
                      final product = brandProducts[index];
                      return Container(
                        width: 110,
                        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1)
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Image.asset(product['imagePath']!,
                                      fit: BoxFit.fitWidth, height: 90),
                                ),
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                                ),
                                child: Center(
                                  child: Text(
                                    product['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      // color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index){
                      return SizedBox(width: 10,);
                    },
                  ),
                ),
                // end Popular Products Section
                const SizedBox(height: 10),
                // Popular Products Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Brands',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const CategoriesScreen());
                      },
                      child: Icon(Icons.list, color: Colors.grey,),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height*0.2,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: brandsData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1
                              )
                            ]),
                        margin: EdgeInsets.all(1),
                        padding: EdgeInsets.all(6),
                        width: Get.width*0.4,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height*0.08,
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5))),
                                      height: Get.height*0.058),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      height: Get.height*0.068,
                                      width: Get.height*0.068,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Get.height*0.068),
                                          color: Colors.white),
                                      child: Container(
                                        height: Get.height*0.065,
                                        width: Get.height*0.065,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  brandsData[index]['image']),
                                              fit: BoxFit.fill),
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height*0.1,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 5),
                                    Text(
                                      brandsData[index]['name'],
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                blurRadius: 3,
                                                color: Colors.grey
                                                    .withOpacity(0.5))
                                          ]),
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      brandsData[index]['subtitle'],
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    )
                                  ]),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),

                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'News',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                              )
                            ]),
                        padding:
                            EdgeInsets.all(5),
                        height: 120,/////////////////////////
                        width: 380,
                        child: Row(
                          children: [
                            Container(
                              width: 190,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsData[index]['title'],
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                            blurRadius: 3,
                                            color: Colors.grey.withOpacity(0.5))
                                      ],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    newsData[index]['subtitle'],
                                    style: TextStyle(fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  child: SizedBox(
                                      height: double.infinity,
                                      width: 165,
                                      child: Image.asset(newsData[index]['image'],
                                          fit: BoxFit.fill))),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),
                SizedBox(height: 25,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
