import 'package:firebase_deneme/appbar.dart';
import 'package:firebase_deneme/homepage.dart';
import 'package:firebase_deneme/page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class user_add extends StatefulWidget {
  const user_add({super.key});

  @override
  State<user_add> createState() => _user_addState();
}

// ignore: camel_case_types
class _user_addState extends State<user_add> {

   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
 Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User registered: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'zayıf şifre') {
        print('Sağlanan şifre çok zayıf.');
      } else if (e.code == 'e-posta-zaten-kullanımda') {
        print('Bu e-posta için hesap zaten mevcut.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: CustomAppBar(
        title: "anasayfa",
        actions: [
          IconButton(
            icon:Icon(Icons.home),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>MyHomePage()));
            }, )
        ],),
    body: Padding(
      padding: const EdgeInsets.all(70),
      child: Column(
        children: [
          TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Şifre'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _register,
              child: const Text('kayıt ol'),
            ),
        ],
      ),),
     
    );
  }
}