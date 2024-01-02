import 'package:firebase_test/core/utils/theme_data.dart';
import 'package:firebase_test/pages/auth/login_page.dart';
import 'package:firebase_test/pages/auth/register_page.dart';
import 'package:firebase_test/pages/inner_pages/product_details.dart';
import 'package:firebase_test/pages/inner_pages/viewed_recently.dart';
import 'package:firebase_test/pages/inner_pages/wishlist.dart';
import 'package:firebase_test/pages/root_page.dart';
import 'package:firebase_test/providers/auth/login_provider.dart';
import 'package:firebase_test/providers/auth/register_provider.dart';
import 'package:firebase_test/providers/image_picker_provider.dart';
import 'package:firebase_test/providers/search_provider.dart';
import 'package:firebase_test/providers/slider_provider.dart';
import 'package:firebase_test/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SearchProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return SliderProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return LoginProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return RegisterProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ImagePickerProvider();
          },
        )
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'e-commerce firebase',
          theme: Styles.themeData(
              isDark: themeProvider.darkTheme, context: context),
          home: const RegisterPage(),
          routes: {
            ProductDetailsPage.routeName: (context) =>
                const ProductDetailsPage(),
            WishListPage.routeName: (context) => const WishListPage(),
            ViewedRecentlyPage.routeName: (context) =>
                const ViewedRecentlyPage(),
            RegisterPage.routeName: (context) => const RegisterPage(),
            LoginPage.routeName: (context) => const LoginPage(),
          },
        );
      }),
    );
  }
}
