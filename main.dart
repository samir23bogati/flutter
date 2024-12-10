//import 'package:calculator/homepage.dart';
import 'package:calculator/components/buttonexample.dart';
import 'package:calculator/components/calculator/calculator_screen.dart';
import 'package:calculator/components/list_example.dart';
import 'package:calculator/components/list_screen.dart';
import 'package:calculator/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator/login_screen.dart';
import 'counter_screen.dart';
import 'package:calculator/components/buttonexample.dart';

void main(){
    runApp(MyApplication());

}

class MyApplication extends StatelessWidget{
    @override
    Widget build(BuildContext context){
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false,
        ),
        //home: Homepage(),
       //home: LoginScreen(),
      //home: ButtonExample(),
       // home:CounterScreen(),
       //home:ListExampleScreen(),
      // home:CaluclatorScreen(),
      home:ListScreen(),
     );

    }
}