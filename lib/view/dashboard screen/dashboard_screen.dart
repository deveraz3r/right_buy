import 'package:rightbuy/Widgets/reusable_app_bar.dart';
import 'package:rightbuy/view/add_item/add_items.dart';

import '../../resources/urls.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // To refresh the tabs when switching
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<String> historyImages = [
    ImageAssets.categoriesImage1,
    ImageAssets.categoriesImage2,
    ImageAssets.categoriesImage3,
    ImageAssets.categoriesImage4,
    ImageAssets.categoriesImage5,
    ImageAssets.categoriesImage6,
    ImageAssets.categoriesImage7,
    ImageAssets.categoriesImage8,
    ImageAssets.categoriesImage1,
    ImageAssets.categoriesImage2,
    ImageAssets.categoriesImage3,
    ImageAssets.categoriesImage4,
    ImageAssets.categoriesImage5,
    ImageAssets.categoriesImage6,
    ImageAssets.categoriesImage7,
    ImageAssets.categoriesImage8
  ];

  final List<String> historyNames = [
    "Bunyad",
    "Cascade",
    "Channel 5",
    "Chappie",
    "Chirat",
    "Citra",
    "Dash",
    "Hadiklaim",
    "Bunyad",
    "Cascade",
    "Channel 5",
    "Chappie",
    "Chirat",
    "Citra",
    "Dash",
    "Hadiklaim"
  ];

  final String constantDescription = "boycott this product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ReusableAppBar(
        titleText: "Dashboard",
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SizedBox(height: Get.height * .01),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 3)
                )
              ]
            ),
            height: Get.height * .06,
            width: Get.height * 1.0,
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(
                color: Colors.transparent,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                _buildTab(Icons.history, 'History'.tr, 0),
                _buildTab(Icons.favorite, 'Donation'.tr, 1),
                _buildTab(Icons.list, 'Items'.tr, 2),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                HistoryTab(),
                DonationHistoryTab(),
                AddedItemsListTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(IconData icon, String text, int index) {
    bool isSelected = _tabController.index == index;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(icon, color: isSelected? Colors.green: Colors.black,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected? Colors.green: Colors.black),),
        ],
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> historyImages = [
      ImageAssets.categoriesImage1,
      ImageAssets.categoriesImage2,
      ImageAssets.categoriesImage3,
      ImageAssets.categoriesImage4,
      ImageAssets.categoriesImage5,
      ImageAssets.categoriesImage6,
      ImageAssets.categoriesImage7,
      ImageAssets.categoriesImage8,
      ImageAssets.categoriesImage1,
      ImageAssets.categoriesImage2,
      ImageAssets.categoriesImage3,
      ImageAssets.categoriesImage4,
      ImageAssets.categoriesImage5,
      ImageAssets.categoriesImage6,
      ImageAssets.categoriesImage7,
      ImageAssets.categoriesImage8
    ];

    final List<String> historyNames = [
      "Bunyad",
      "Cascade",
      "Channel 5",
      "Chappie",
      "Chirat",
      "Citra",
      "Dash",
      "Hadiklaim",
      "Bunyad",
      "Cascade",
      "Channel 5",
      "Chappie",
      "Chirat",
      "Citra",
      "Dash",
      "Hadiklaim"
    ];

    const String constantDescription = "boycott this product";
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(225, 0, 150, 57),
              Color.fromARGB(255, 237, 46, 56),
            ]
        ),
      ),
      child: ListView.builder(
        itemCount: historyImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2, top: 8, left: 8, right: 8),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                    // offset: Offset(0, 2)
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(historyImages[index]),
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: -2, blurRadius: 4
                      ),
                    ],
                  ),
                ),
                title: Text(
                  historyNames[index],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  constantDescription,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DonationHistoryTab extends StatelessWidget {
  const DonationHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(225, 0, 150, 57),
            Color.fromARGB(255, 237, 46, 56),
          ]
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * .006),
          Container(
            alignment: Alignment.topCenter,
            height: Get.height * .25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/donate.jfif.jpg'))),
            child: Column(
              children: [
                SizedBox(height: Get.height * .04),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: Get.width * .28,
                    height: Get.height * .06,
                    decoration: const BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Center(
                      child: Text('urgent'.tr, style: GoogleFonts.poppins()),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .09),
                Text('donate_tab_quote'.tr,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          SizedBox(height: Get.height * .035),
          Container(
            height: Get.height * .065,
            decoration: const BoxDecoration(color: Colors.yellow),
            child: Center(
                child: Text('donate_now'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500))),
          )
        ],
      ),
    );
  }
}

class AddedItemsListTab extends StatelessWidget {
  const AddedItemsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> addedItemsImages = [
      // ImageAssets.addIcon,
      ImageAssets.categoriesImage1, ImageAssets.categoriesImage2,
      ImageAssets.categoriesImage3,
      ImageAssets.categoriesImage4, ImageAssets.categoriesImage5,
      ImageAssets.categoriesImage6,
      ImageAssets.categoriesImage7, ImageAssets.categoriesImage8,
      ImageAssets.categoriesImage1,
      ImageAssets.categoriesImage2, ImageAssets.categoriesImage3,
      ImageAssets.categoriesImage4,
      ImageAssets.categoriesImage5, ImageAssets.categoriesImage6,
      ImageAssets.categoriesImage7,
      ImageAssets.categoriesImage8
    ];

    final List<String> addedItemsNames = [
      "add_item".tr,
      "Bunyad",
      "Cascade",
      "Channel 5",
      "Chappie",
      "Chirat",
      "Citra",
      "Dash",
      "Hadiklaim",
      "Bunyad",
      "Cascade",
      "Channel 5",
      "Chappie",
      "Chirat",
      "Citra",
      "Dash",
      "Hadiklaim"
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(225, 0, 150, 57),
              Color.fromARGB(255, 237, 46, 56),
            ]
        ),
      ),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: List.generate(addedItemsImages.length, (index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                // Navigate to add item screen
                Get.to(() => const AddItemScreen());
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
                      // offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: Get.width * .24,
                      height: Get.height * .08,
                      child: Image.asset('assets/icons/add.png'),
                    ),
                    Text(
                      'add_item'.tr,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                    spreadRadius: 1,
                    // offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: Get.width * .24,
                    height: Get.height * .08,
                    child: Image.asset(addedItemsImages[index]),
                  ),
                  Text(
                    addedItemsNames[index],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
