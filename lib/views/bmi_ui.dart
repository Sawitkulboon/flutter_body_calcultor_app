// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //ตัวควบคุม Textfiled
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  //สร้างตัวแปร
  String bmiShowValue = '0.00';
  String bmiShowResult = 'การแปรผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนชื่อหน้าจอ และรูป
                Text(
                  'คำนวนหาค่าดัชนีมวลกาย (BMI)'
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),

                //ส่วนของการป้อนข้อมูล
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก KG'
                  ),
                ),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอน้ำหนัก',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง CM'
                  ),
                ),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกส่วนสูง',
                    border: OutlineInputBorder(),
                  ),
                ),
                //ส่วนปุ่ม
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //validate UI (การตรวจสอบข้อมูล)
                    if(wCtrl.text.isEmpty || hCtrl.text.isEmpty){
                      //แสดงข้อความแจ้งเตือนผู้ใช้
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('กรุณากรอกข้อมูล'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return; //return เพื่อไม่ให้ทำอย่างอื่นๆ
                    }

                    //คำนวณและแสดงผล BMI
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    double bmi = w / (h * h) * 10000;

                    setState(() {
                      bmiShowValue = bmi.toStringAsFixed(2);
                    });

                    

                    //แปลผลและแสดงผลการแปรผล

                    setState(() {
                      if (bmi < 18.5) {
                        bmiShowResult = 'ผอม';
                      } else if (bmi <= 22.9) {
                        bmiShowResult = 'สมส่วน';
                      } else if (bmi <= 24.9) {
                        bmiShowResult = 'ถ่วม';
                      } else if (bmi <= 29.9) {
                        bmiShowResult = 'โรคอ้วนระดับ 1';
                      } else {
                        bmiShowResult = 'โรคอ้วนระดับ 2';
                      }
                      
                    });
                  },
                  child: Text(
                    'คํานวณ BMI',
                    ), 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wCtrl.text = '';
                      hCtrl.text = '';
                      bmiShowValue = '0.00';
                      bmiShowResult = 'การแปรผล';
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 131, 130, 129),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                ),
                SizedBox(height: 20),
                //ส่วนแสดงผลข้อมูลที่ได้จากการคำนวน
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 47, 255, 148),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                      ),
                      Text(
                        bmiShowValue,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiShowResult,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}