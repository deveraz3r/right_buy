import 'package:rightbuy/Widgets/reusable_app_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/controller.dart';
import '../resources/urls.dart';

class SelectLanguageScreen extends StatelessWidget {
  SelectLanguageScreen({super.key});
  final LanguageController _languageController = Get.put(LanguageController());

  final List<Map<String, String>> languages = [
    {"language": "English", "image": "assets/flags/english.png"},
    {"language": "French", "image": "assets/flags/french.png"},
    {"language": "Germany", "image": "assets/flags/germany.png"},
    {"language": "Hindi", "image": "assets/flags/hindi.png"},
    {"language": "Indonesian", "image": "assets/flags/indonesian.png"},
    {"language": "Israel", "image": "assets/flags/israel.png"},
    {"language": "Japanese", "image": "assets/flags/japanese.png"},
    {"language": "Korean", "image": "assets/flags/korean.png"},
    {"language": "Portuguese", "image": "assets/flags/portuguese.png"},
    {"language": "Russia", "image": "assets/flags/russia.png"},
    {"language": "Spanish", "image": "assets/flags/spanish.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: "Select Language",
        centerTitle: false,
        actions: [
          ElevatedButton(
              onPressed: (){
                if (_languageController.selectedLanguage.isNotEmpty) {
                  Get.offNamed(RoutesNames.bottomNavigationBar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select a language!")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
              ),
              child: const Text("Done")
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (_languageController.isLoading.value) {
            return ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            );
          } else {
            return ListView.separated(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _languageController.selectedLanguage.value = languages[index]['language']!;
                  },
                  child: Obx(() {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        // border: Border.all(color: Colors.grey),
                        color: languages[index]['language'] == _languageController.selectedLanguage.value
                            ? Colors.grey[350]
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1
                          )
                        ]
                      ),
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 1
                                  )
                                ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(languages[index]['image']!),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              languages[index]['language']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            );
          }
        }),
      ),
    );
  }
}
