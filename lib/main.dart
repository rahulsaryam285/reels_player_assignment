import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reels_player/utils/navigators/navigators.dart';
import 'package:reels_player/utils/utils.dart';

export 'controllers/controllers.dart';
export 'data/data.dart';
export 'models/models.dart';
export 'repositories/repositories.dart';
export 'res/res.dart';
export 'utils/utils.dart';
export 'view_models/view_models.dart';
export 'views/views.dart';
export 'widgets/widgets.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.purple),
          translations: TranslationsFile(),
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        ),
      );
}
