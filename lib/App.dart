import 'package:flutter/material.dart';
import 'package:messenger_app/Providers/BottomProviders.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/Providers/SelectContactForGrProviders.dart';
import 'package:messenger_app/RouteGenerator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  List<String> _selecteItems;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            Provider<RegisterProviders>(create: (_) => RegisterProviders()),
            Provider<BottomProvider>(create: (_) => BottomProvider()),
            Provider<SelectProvider>(create: (_)=>SelectProvider(this._selecteItems)),
            ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.homeScreen,
        onGenerateRoute: RouteGenerator.generatorRoute,
        theme: ThemeData(
          primaryColor: Colors.white,
          
        ),
 
      ),
    );
  }
}