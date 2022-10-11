import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/data/repository/auth_repository.dart';
import '../../data/repository/app_repository.dart';
import '../../main/main_home.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppRepository>(
          create: (context) => AppRepository(),
        ),
        RepositoryProvider<MainRepository>(
          create: (context) => MainRepository(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        // RepositoryProvider<CartRepository>(
        //   create: (context) => CartRepository(),
        // ),
        // RepositoryProvider<FavouriteRepository>(
        //   create: (context) => FavouriteRepository(),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
              appRepository: RepositoryProvider.of<AppRepository>(context),
            ),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(
              RepositoryProvider.of<MainRepository>(context),
            ),
          ),
          // BlocProvider<CartBloc>(
          //   create: (context) => CartBloc(
          //     cartRepository: RepositoryProvider.of<CartRepository>(context),
          //     appRepository: RepositoryProvider.of<AppRepository>(context),
          //   ),
          // ),
          // BlocProvider<FavouriteBloc>(
          //   create: (context) => FavouriteBloc(
          //     RepositoryProvider.of<FavouriteRepository>(context),
          //   ),
          // ),
        ],
        child: MaterialApp(
          theme: ThemeData(),
          initialRoute: '/',
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
