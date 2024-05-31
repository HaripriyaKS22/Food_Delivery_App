import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:homfoo/home.dart';
import 'package:homfoo/login.dart';
import 'package:homfoo/maphome.dart';

void main(){
  runApp(homefoo());
}
class homefoo extends StatefulWidget {
  const homefoo({super.key});

  @override
  State<homefoo> createState() => _homefooState();
}

class _homefooState extends State<homefoo> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Colors.white
           // Set your desired color here
));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: manege(),
    );
  }
}
class manege extends StatefulWidget {
  const manege({super.key});

  @override
  State<manege> createState() => _manegeState();
}

class _manegeState extends State<manege> {
  @override
  Widget build(BuildContext context) {
    return home();
  }
}