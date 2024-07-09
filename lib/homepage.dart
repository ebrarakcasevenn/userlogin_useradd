import 'package:firebase_deneme/appbar.dart';
import 'package:firebase_deneme/user_add.dart';
import 'package:firebase_deneme/user_login.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "anasayfa",
        ),
      body: Center(
       child: 
       Padding(
         padding: const EdgeInsets.all(70),
         child: Column(
           children: [
             ElevatedButton(
               onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const user_add()),
                    );
                  },
                  child: const Text("kayıt ol"),
                 ),
                 
                 ElevatedButton(
               onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const user_login()),
                );
              },
              child: const Text("giriş yap"),
             ),
           ],
         ),
       ),
      
      ),
    );
  }
}