import 'package:flutter/material.dart';
import 'package:flutter_body_calcultor_app/views/home_ui.dart';


class SplashCreenUi extends StatefulWidget {
  const SplashCreenUi({super.key});

  @override
  State<SplashCreenUi> createState() => _SplashCreenUiState();
}

class _SplashCreenUiState extends State<SplashCreenUi> {
  @override
  void initState() {
    // หน่วงเวลาหน้าจอ 3 วิ แล้วเปิดไปน้า Home UI แบบย้อนกลับไม่ได้
    Future.delayed(
      //เวลาที่จะหน่วง
      Duration(seconds: 3),
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUi(),
          ),

        );
      }
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 89, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Body Health Calcultor',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2026 All rights reserved',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              'Created by:Sawit SAU',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}