import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:to_do_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:to_do_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/change_password.dart';
import 'package:to_do_app/features/home/domain/use_case/delete_todo_use_case.dart';
import 'package:to_do_app/features/home/presentaion/ui_screens/detail_todo.dart';
import 'package:to_do_app/features/home/data/data_source/home_data_source.dart';
import 'package:to_do_app/features/home/data/data_source/home_data_source_impl.dart';
import 'package:to_do_app/features/home/data/repo/home_repo_impl.dart';
import 'package:to_do_app/features/home/domain/use_case/create_todo_use_case.dart';
import 'package:to_do_app/features/home/domain/use_case/get_todo_use_case.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/ui_screens/home.dart';
import 'package:to_do_app/features/profile/data/data_source/profile_data_source_impl.dart';
import 'package:to_do_app/features/profile/data/repo/repo_impl.dart';
import 'package:to_do_app/features/profile/domain/repo/base_repo.dart';
import 'package:to_do_app/features/profile/presentation/ui_screens/profile_screen.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/signup_screen.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/splash_screen/splash_screen.dart';
import 'features/auth/presentation/ui_screens/signin_screen.dart';
import 'features/home/domain/use_case/edit_todo_use_case.dart';
import 'features/profile/domain/use_case/sign_out_use_case.dart';
import 'features/profile/presentation/proffile_cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthCubit(AuthRepoImpl(AuthRemoteDataSourceImpl())),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileSignOutUseCase(ProfileRepoImpl(ProfileRemoteDataSourceImpl()))),
        ),
        BlocProvider(
            create: (
                context)=>HomeCubit(
                CreateTodoUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
                GetTodoUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
    DeleteTodoUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())),
              EditTodoUseCase(HomeRepoImpl(HomeRemoteDataSourceImpl())), ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'To Do',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
        routes: {
          "splash": (context) => SplashScreen(),
          "signup": (context) => SignUpScreen(),
          "signin": (context) => SignInScreen(),
          "home": (context) => HOmeScreen(),
          "changepassword": (context) => ChangePassword(),
          "profile": (context) => ProfileScreen(),
      },
      ),
    );
  }
}
