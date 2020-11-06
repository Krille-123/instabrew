import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:instadrunkapp/model/cart.dart';
import 'package:instadrunkapp/model/search_query.dart';
import 'package:instadrunkapp/screens/products/products.dart';
import 'package:instadrunkapp/shared/widgets/loading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SearchQuery>(
            create: (context) => SearchQuery(),
          ),
          ChangeNotifierProvider<Cart>(
            create: (context) => Cart(),
          )
        ],
        child: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primaryColor: kPrimaryColor,
                      backgroundColor: kBackgroundColor,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      textTheme: GoogleFonts.nunitoTextTheme(
                        Theme.of(context).textTheme,
                      ),
                    ),
                    home: Products());
              }

              return Loading();
            }));
  }
}
