import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_appraisal/core/navigation_service.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_user_remote_datasource.dart';
import 'package:mobile_appraisal/data/datasources/dashboard/dashboard_datasource.dart';
import 'package:mobile_appraisal/data/datasources/job/job_list_datasource.dart';
import 'package:mobile_appraisal/data/datasources/master/list_master_datasource.dart';
import 'package:mobile_appraisal/data/datasources/profile/profile_update_datasource.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/getuser/getuser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/loginuser/loginuser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/registeruser/registeruser_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/bloc/resetpassword/resetpassword_bloc.dart';
import 'package:mobile_appraisal/presentation/auth/pages/login_exp_page.dart';
import 'package:mobile_appraisal/presentation/dashboard/bloc/dashboard_done/dashboard_done_bloc.dart';
import 'package:mobile_appraisal/presentation/dashboard/bloc/dashboard_pending/dashboard_pending_bloc.dart';
import 'package:mobile_appraisal/presentation/dashboard/bloc/dashboard_progress/dashboard_progress_bloc.dart';
import 'package:mobile_appraisal/presentation/job/bloc/disposisi_create/disposisi_create_bloc.dart';
import 'package:mobile_appraisal/presentation/job/bloc/job_list_progres/job_lis_progres_bloc.dart';
import 'package:mobile_appraisal/presentation/master/bloc/listjabatan/listjabatan_bloc.dart';
import 'package:mobile_appraisal/presentation/master/bloc/listuserdispo/list_user_disposisi_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/bloc/logout/logout_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/bloc/updateprofile/updateprofile_bloc.dart';

import 'core/core.dart';
import 'presentation/auth/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetuserBloc>(
          create: (context) => GetuserBloc(AuthUserRemoteDatasource()),
        ),
        BlocProvider<RegisteruserBloc>(
          create: (context) => RegisteruserBloc(AuthUserRemoteDatasource()),
        ),
        BlocProvider<LoginuserBloc>(
          create: (context) => LoginuserBloc(AuthUserRemoteDatasource()),
        ),
        BlocProvider<LogoutBloc>(
          create: (context) => LogoutBloc(AuthUserRemoteDatasource()),
        ),
        BlocProvider<ResetpasswordBloc>(
          create: (context) => ResetpasswordBloc(AuthUserRemoteDatasource()),
        ),
        BlocProvider<ListjabatanBloc>(
          create: (context) => ListjabatanBloc(ListMasterRemoteDatasource()),
        ),
        BlocProvider<UpdateprofileBloc>(
          create: (context) =>
              UpdateprofileBloc(ProfileUpdateRemoteDatasource()),
        ),
        BlocProvider<DashboardDoneBloc>(
          create: (context) => DashboardDoneBloc(DashboardRemoteDatasource()),
        ),
        BlocProvider<DashboardPendingBloc>(
          create: (context) =>
              DashboardPendingBloc(DashboardRemoteDatasource()),
        ),
        BlocProvider<DashboardProgressBloc>(
          create: (context) =>
              DashboardProgressBloc(DashboardRemoteDatasource()),
        ),
        BlocProvider<JobLisProgresBloc>(
          create: (context) => JobLisProgresBloc(JobListRemoteDatasource()),
        ),
        BlocProvider<ListUserDisposisiBloc>(
          create: (context) =>
              ListUserDisposisiBloc(ListMasterRemoteDatasource()),
        ),
        BlocProvider<DisposisiCreateBloc>(
          create: (context) => DisposisiCreateBloc(JobListRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfig.nameApp,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          dividerTheme:
              DividerThemeData(color: AppColors.white.withValues(alpha: 0.5)),
          dialogTheme: const DialogTheme(elevation: 0),
          textTheme: GoogleFonts.kumbhSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.kumbhSans(
              color: AppColors.black,
              fontSize: AppSizeFont.xxl,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SplashPage(),
        routes: {
          '/loginexpired': (context) => const LoginExpPage(),
        },
      ),
    );
  }
}
