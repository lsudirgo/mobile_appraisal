class AppConfig {
  static String baseUrlapi = "http://192.168.0.145:5000";
  static String baseUrl = "https://capekngoding.com";
  static String token = "";

  //Endpoint API
  static String urlgetUserAuth = '$baseUrlapi/auth';
  static String urlUserID = '$baseUrlapi/Users';
  static String urlLogin = '$baseUrlapi/auth/Login';

  ///App
  static String version = "1.0.0";
  static String nameApp = "Mobile Appraisal";
  static int launcTimeApp = 2;

  //image
  static String imgLogin = "assets/images/login_1.png";
  static String imgRegister = "assets/images/register.png";
  static String imgChangePassword = "assets/images/forgot_password.png";
  static String imgEmptyData = "assets/images/not_found.png";
  static String imgLogOut = "assets/images/log_out.png";
}
