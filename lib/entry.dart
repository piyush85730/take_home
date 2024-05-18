import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:take_home/core/constants/string_constants.dart';
import 'package:take_home/core/constants/theme_constants.dart';
import 'package:take_home/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:take_home/core/utils/utils.dart';
import 'package:take_home/feature/post/presentation/cubit/post_cubit.dart';
import 'package:take_home/feature/post_detail/presentation/cubit/post_detail_cubit.dart';
import 'package:take_home/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:take_home/feature/splash/presentation/pages/splash_page.dart';
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/router.dart';

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    preLoadImages(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CheckInternetCubit>(),
          lazy: false,
        ),
        BlocProvider(create: (context) => sl<SplashCubit>()),
        BlocProvider(create: (context) => sl<PostsCubit>()),
        BlocProvider(create: (context) => sl<PostDetailCubit>()),
      ],
      child: MaterialApp(
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRoute,
        builder: OneContext().builder,
        navigatorKey: OneContext().key,
        theme: ThemeData(
          scaffoldBackgroundColor: ThemeColors.clrScaffoldBG,
          primaryColor: ThemeColors.clrWhite,
          primaryColorLight: ThemeColors.clrWhite,
          primaryColorDark: ThemeColors.clrWhite,
          canvasColor: ThemeColors.clrWhite,
          appBarTheme: AppTheme.appBarTheme(),
          textTheme: AppTheme.textTheme(context),
          buttonTheme: AppTheme.buttonThemeData(context),
          elevatedButtonTheme: AppTheme.elevatedButtonThemeData(),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(surface: ThemeColors.clrWhite),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
