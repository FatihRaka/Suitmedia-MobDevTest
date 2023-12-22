import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sentenceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Image.asset(
                  'assets/images/ic_photo.png',
                  width: 116.0,
                  height: 116.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 60.0),
                Container(
                  width: 340.0,
                  height: 45.0,
                  child: TextField(
                    controller: nameController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      floatingLabelBehavior: nameController.text.isEmpty ? null : FloatingLabelBehavior.always,
                      labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Color(0x6867775C)),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 340.0,
                  height: 45.0,
                  child: TextField(
                    controller: sentenceController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: 'Palindrome',
                      floatingLabelBehavior: sentenceController.text.isEmpty ? null : FloatingLabelBehavior.always,
                      labelStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Color(0x6867775C)),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  width: 340.0,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isPalindrome = checkPalindrome(sentenceController.text);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Result', style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0)),
                          content: Text(isPalindrome ? 'isPalindrome' : 'Not Palindrome', style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0)),
                        ),
                      );
                    },
                    child: Text('CHECK', style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: Color(0xFF2B637B),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 340.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen(firstName: nameController.text)),
                      );
                    },
                    child: Text('NEXT', style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: Color(0xFF2B637B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool checkPalindrome(String text) {
    String reversed = text.split('').reversed.join();
    return text == reversed;
  }
}
