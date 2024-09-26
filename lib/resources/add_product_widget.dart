import 'package:rightbuy/resources/urls.dart';

class AddProductWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const AddProductWidget({super.key, required this.hintText, required this.controller});

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .07,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Remove the underline
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
        textAlignVertical: TextAlignVertical.center, // Center the text vertically
      ),
    );
  }
}