import '../urls.dart';

class GeneralExceptionsWidget extends StatelessWidget {
  const GeneralExceptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.cloud_off, size: 40, color: redColor),
            Text('internet_exceptions'.tr,
                textAlign: TextAlign.center),
            SizedBox(height: Get.height * .020),
            Container(
              width: Get.width * .2,
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(5)),
              child: const Text('Retry',
                  textAlign: TextAlign.center),
            ),
          ]),
        ),
      ),
    );
  }
}
