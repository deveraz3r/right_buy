
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/urls.dart';

class Utils {
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static centerToastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: blackColor,
      textColor: Colors.white,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG
    );
  }
}