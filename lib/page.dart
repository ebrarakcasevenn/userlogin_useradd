import 'package:firebase_deneme/appbar.dart';
import 'package:firebase_deneme/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';





class page extends StatelessWidget {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "anasayfa",
        actions: [
          IconButton(
            icon:const Icon(Icons.home),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>MyHomePage()));
            }, )
        ],),
      body: const Center(
       child: Text("başarılı giriş"),
      ),
    );
  }
}
