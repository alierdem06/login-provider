import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_provider/feature/onboard/on_board_view.dart';
import 'package:login_provider/product/model/state/project_context.dart';
import 'package:login_provider/product/model/state/user_context.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductContext(),
        ),
        ProxyProvider<ProductContext, UserContext>(
          update: (context, productContext, userContext) {
            return userContext != null
                ? userContext.copyWith(name: productContext.newUserName)
                : UserContext(productContext.newUserName);
          },
        ),
        ChangeNotifierProvider(
          create: (context) => ProductContext(),
        ),
      ],
      child: MaterialApp(
        title: "Provider Login",
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(11, 23, 84, 1),
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark),
        ),
        debugShowCheckedModeBanner: false,
        home: const OnBoardView(),
      ),
    );
  }
}
