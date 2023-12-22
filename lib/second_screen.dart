import 'package:flutter/material.dart';
import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String firstName;

  SecondScreen({required this.firstName});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String? selectedUserNameFromThirdScreen;

  @override
  void initState() {
    super.initState();
    selectedUserNameFromThirdScreen = null;
  }

  void updateSelectedUserName(String newName) {
    setState(() {
      selectedUserNameFromThirdScreen = newName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 21.0)),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/ic_back@3x.png',
            width: 60.0,
            height: 100.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: const Color.fromARGB(255, 181, 181, 181),
            thickness: 0.5,
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 16.0, top: 10.0),
            child: Text('Welcome', style: TextStyle(fontFamily: 'Poppins', )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 16.0, top: 0.0),
            child: Text('${widget.firstName}', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Expanded(
            child: Center(
              child: selectedUserNameFromThirdScreen != null
                  ? Text('$selectedUserNameFromThirdScreen', style: TextStyle(fontFamily: 'Poppins', fontSize: 30, fontWeight: FontWeight.w900))
                  : Text('Selected User Name', style: TextStyle(fontFamily: 'Poppins', fontSize: 27, fontWeight: FontWeight.w900)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 340.0,
                child: ElevatedButton(
                  onPressed: () async {
                    // Wait for user selection and update the selected user name
                    final result = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdScreen()),
                    );

                    // Check if the result is not null
                    if (result != null) {
                      // Update the selected user name
                      updateSelectedUserName(result);
                    }
                  },
                  child: Text('Choose a User', style: TextStyle(fontFamily: 'Poppins', fontSize: 14.0, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: Color(0xFF2B637B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
