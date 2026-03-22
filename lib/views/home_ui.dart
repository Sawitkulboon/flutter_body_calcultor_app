import 'package:flutter/material.dart';
import 'package:flutter_body_calcultor_app/views/about_ui.dart';
import 'package:flutter_body_calcultor_app/views/bmi_ui.dart';
import 'package:flutter_body_calcultor_app/views/bmr_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //เก็บหมายเลข index เพื่อเอาไปใช้กับ baritem
  int selectedIndex = 1;

//สร้างตัวแปรเก็บหน้าจอย่อยที่เอาไปใช้กับ body
  List subPage = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ appbar
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'BHC App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      //ส่วนของ buttonnavigationbar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'เกี่ยวกับ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank_rounded,
            ),
            label: 'BMR',
          ),
        ],
      ),
      //ส่วนของ Body
      body: subPage[selectedIndex],
    );
  }
}