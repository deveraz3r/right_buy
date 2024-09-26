import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  ReusableAppBar({
    super.key,
    required this.titleText,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.enableBack = false,
    this.appBarTitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String titleText;
  bool centerTitle;
  List<Widget>? actions;
  bool enableBack;
  Widget? leading;
  Widget? appBarTitle;

  Widget _backButton = IconButton(
      onPressed: (){
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      )
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      leading: enableBack? _backButton : leading,
      centerTitle: centerTitle,
      title: appBarTitle ?? Text(
        titleText.tr,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white
        )
      ),
      actions: actions,
    );
  }
}
