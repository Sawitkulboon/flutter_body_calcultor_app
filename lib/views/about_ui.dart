import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //ชั้นที่ 1 
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Helth Calculator',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                  width: 120,
                ),
                SizedBox(height: 30),
                Text(
                  'คำนวนค่าดัชนีมวลกาย BMI'
                ),
                SizedBox(height: 20),
                Text(
                  'คำนวนหาแคลลอรี่ที่ร่างกายต้องการในแต่ละวัน(BMR)'
                ),
                
              
              ],
            ),
          ),
          
          //ชั้นที่2
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png',
                    height: 80,
                    width: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'Developed by Sawit in 2026',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}