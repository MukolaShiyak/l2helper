import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:l2helper_v2/cubit/craft_cubit.dart';
import 'package:l2helper_v2/routes.dart';
import 'package:l2helper_v2/utility/app_observer_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp(
        // appRouter: AppRouter(),
        )),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      builder: (context, child) => BlocProvider<CraftCubit>(
        create: (context) => CraftCubit(),
        child: MaterialApp(
          title: 'L2 helper',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, widget) {
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          // home: MainPage(),
          routes: routes,
          onGenerateRoute: onGenerateRoutes,
        ),
      ),
    );
  }
}
