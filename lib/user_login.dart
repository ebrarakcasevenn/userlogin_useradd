import 'package:firebase_deneme/appbar.dart';
import 'package:firebase_deneme/homepage.dart';
import 'package:firebase_deneme/page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class user_login extends StatefulWidget {
  const user_login({super.key});

  @override
  State<user_login> createState() => _user_loginState();
}

class _user_loginState extends State<user_login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage="";
  
  Future<void> _login() async {

    setState(() {
      _errorMessage = '';
    });
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User signed in: ${userCredential.user?.email}");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=> page()),);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Kullanıcı bulunamadı') {
        _errorMessage='Bu e-posta için kullanıcı bulunamadı.';
      } else if (e.code == 'yanlış şifre') {
        _errorMessage='Yanlış şifre sağlandı.';
      } else {
        _errorMessage='Error: ${e.message}';
      }
    } catch (e) {
      _errorMessage='Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              decoration: InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "şifre"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("giriş")),
            if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ), )
          ],
        ),
        ),
        
    );
  }
}