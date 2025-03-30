import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reusebook/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/favorites_controller.dart';
import 'login.dart';
import 'package:get/get.dart';
import 'localization_service.dart';
import 'controllers/cart_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Add this line
  Get.put(CartController()); // Register it globally
  Get.put(FavoritesController()); // add this line
  // Load saved language from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Locale savedLocale = await LocalizationService.getSavedLocale();
  String? token = prefs.getString('token');
  runApp(MyApp(token: token, initialLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;
  final token;
  const MyApp({
    required this.initialLocale,
    this.token,
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: initialLocale,  // Load saved language
      //fallbackLocale: Locale('en', 'US'),
      fallbackLocale: LocalizationService.fallbackLocale, // Default fallback
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 240, 146, 6)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Login"),
      ),
      body: Image.asset('assets/images/Tablet login-rafiki.png'),
    );
  }
}
