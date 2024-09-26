import 'package:get/get_navigation/src/root/internacionalization.dart';


class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {

      'history_screen' : 'History Screen',
      'dashboard_screen' : 'Dashboard Screen',
      'search_history' : 'Search\nHistory',
      'added_items' : 'Added\nItems',
      'donation_history' : 'Donation\nHistory',

      'welcome_back' : 'Welcome\nBack',
      'login_screen' : 'Login Screen',
      'email_hint' : 'Email',
      'email_snackbar_text': 'Enter Email',
      'password_snackbar_text' : 'Enter Password',
      'password_hint' : 'Password',
      'localization_text' : 'I am Mamoon Shahzad\n and I am a flutter mobile\n application developer at 92 Devs',
      'internet_exceptions' : "We're unable to show results \nPlease check your data\nconnection ",
    },
    'ur_PK' : {
      'email_hint' : 'ای میل درج کریں',
      'localization_text' : 'میں مامون شہزاد ہوں اور میں 92 Devs پر فلٹر موبائل ایپلیکیشن ڈویلپر ہوں۔'
    }
  };
}
