import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:rightbuy/resources/urls.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Get.offNamed(RoutesNames.selectLanguageScreen);
    });
  }

  void _onAnimationComplete() {
    setState(() {
      _isAnimationCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCDFCC3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Image.asset('assets/images/Right.png', width: 82),
            ),
            Image.asset('assets/images/Buy!.png', width: 180),
            SizedBox(height: 50),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 25.0,
                fontFamily: 'popin',
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
              child: _isAnimationCompleted
                  ? Column(
                children: [
                  Text('This movement is to'),
                  Text('Support the community'),
                  Text('Finding you alternatives'),
                ],
              )
                  : AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('This movement is to', speed: Duration(milliseconds: 40)),
                  TyperAnimatedText('Support the community', speed: Duration(milliseconds: 40)),
                  TyperAnimatedText('Finding you alternatives', speed: Duration(milliseconds: 40)),
                ],
                onFinished: _onAnimationComplete,
              ),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
