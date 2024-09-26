import '../urls.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.height = 30,
      this.width = 60,
      required this.onPress,
      this.textColor = blackColor,
      this.buttonColor = primaryColor});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: loading ?
            const Center(child: CircularProgressIndicator()) :
            Center(child: Text(title))
      ),
    );
  }
}
