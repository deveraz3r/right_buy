import '../../resources/urls.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<String> historyImages = [
    ImageAssets.categoriesImage1, ImageAssets.categoriesImage2, ImageAssets.categoriesImage3,
    ImageAssets.categoriesImage4, ImageAssets.categoriesImage5, ImageAssets.categoriesImage6,
    ImageAssets.categoriesImage7, ImageAssets.categoriesImage8, ImageAssets.categoriesImage1,
    ImageAssets.categoriesImage2, ImageAssets.categoriesImage3, ImageAssets.categoriesImage4,
    ImageAssets.categoriesImage5, ImageAssets.categoriesImage6, ImageAssets.categoriesImage7,
    ImageAssets.categoriesImage8
  ];

  final List<String> historyNames = [
    "Bunyad", "Cascade", "Channel 5", "Chappie", "Chirat", "Citra", "Dash",
    "Hadiklaim", "Bunyad", "Cascade", "Channel 5", "Chappie", "Chirat", "Citra",
    "Dash", "Hadiklaim"
  ];

  final String constantDescription = "boycott this product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text('history_screen'.tr),
      ),
      body: ListView.builder(
        itemCount: historyImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 13, top: 2),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: -3, blurRadius: 3, offset: Offset(0, 3)),
                ],
                // border: Border.all()
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image:  AssetImage(historyImages[index]),
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
                    // border: Border.all(),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: -2, blurRadius: 4),
                    ],
                  ),
                  // child: Image.asset(historyImages[index]),
                ),
                title: Text(
                  historyNames[index],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  constantDescription,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      historyImages.removeAt(index);
                      historyNames.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}