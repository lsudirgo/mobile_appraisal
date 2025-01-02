class AppConfig {
  static String baseUrlapi = "http://192.168.210.31:8000/Mobile";

  //Endpoint API
  static String urlUserID = '$baseUrlapi/Authmobile/Userid';
  static String urlRegister = '$baseUrlapi/Authmobile/Register';
  static String urlLogin = '$baseUrlapi/Authmobile/Login';
  static String refreshToken = '$baseUrlapi/Authmobile/Refreshtoken';
  static String urlTraceCreate = '$baseUrlapi/Authmobile/Tracelogin';
  static String urlTraceUpdate = '$baseUrlapi/Authmobile/Tracelogin/Update';
  static String urlResetPassword = '$baseUrlapi/Authmobile/Resetpassword';
  static String urlmasterListJabatan = '$baseUrlapi/Profile/Jabatan';
  static String urlmasterListDisposisi =
      '$baseUrlapi/Userreviewer/Userreviewer';
  static String urlDisposisiOrder = '$baseUrlapi/Disposisi/Create';

  //EndPoint API Authentication
  static String urlupdateProfile = '/Profile/Update';
  static String urlLogout = '/Authmobile/Logout';
  static String urlDashboardDone = '/Dashboard/Done';
  static String urlDashboardPending = '/Dashboard/Pending';
  static String urlDashboardProgress = '/Dashboard/Progress';
  static String urlJobList = '/Order/Progress';

  ///App
  static String version = "0.0.1";
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
  static int debouce = 1000;
}
