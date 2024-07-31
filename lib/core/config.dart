class AppConfig {
  static String baseUrlapi = "http://192.168.1.15:8000/Mobile";

  //Endpoint API
  static String urlUserID = '$baseUrlapi/Authmobile/Userid';
  static String urlRegister = '$baseUrlapi/Authmobile/Register';
  static String urlLogin = '$baseUrlapi/Authmobile/Login';
  static String refreshToken = '$baseUrlapi/Authmobile/Refreshtoken';
  static String urlTraceCreate = '$baseUrlapi/Authmobile/Tracelogin';
  static String urlTraceUpdate = '$baseUrlapi/Authmobile/Tracelogin/Update';
  static String urlResetPassword = '$baseUrlapi/Authmobile/Resetpassword';
  static String urlmasterListJabatan = '$baseUrlapi/Profile/Jabatan';
  //EndPoint API Authentication
  static String urlupdateProfile = '/Profile/Update';
  static String urlLogout = '/Authmobile/Logout';

  ///App
  static String version = "1.0.0";
  static String nameApp = "Mobile Appraisal";
  static int launcTimeApp = 2;

  //image
  static String imgLogin = "assets/images/login_1.png";
  static String imgRegister = "assets/images/register.png";
  static String imgChangePassword = "assets/images/forgot_password.png";
  static String imgEmptyDataNull = "assets/images/not_found.png";
  static String imgLogOut = "assets/images/log_out.png";

  //Dio Time Out
  static int timeOut = 10;
  static int receivetimeOut = 10;

  //delayed development
  static int delay = 1;
}
