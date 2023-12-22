import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Map<String, dynamic>> users = [];
  int currentPage = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=$currentPage&per_page=$perPage'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['data'] is List) {
        setState(() {
          users.addAll((data['data'] as List).cast<Map<String, dynamic>>());
        });
      } else {
        // Handle unexpected API response format
        print('Unexpected API response format');
      }
    } else {
      // Handle error
      print('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 21.0)),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/ic_back@3x.png',
            width: 60.0,
            height: 60.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Divider(
            color: const Color.fromARGB(255, 181, 181, 181),
            thickness: 0.5,
            height: 20.0,
          ),
          
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  users = [];
                  currentPage = 1;
                });
                await fetchUsers();
              },
              // ...

child: ListView.builder(
  itemCount: users.length,
  itemBuilder: (context, index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${users[index]['avatar']}'),
            radius: 30.0, // Adjust the radius to make the avatar larger
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${users[index]['first_name']} ${users[index]['last_name']}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${users[index]['email']}',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          onTap: () {
            // Navigate to the SecondScreen and update the selected user name
            Navigator.pop(context, '${users[index]['first_name']}');
          },
        ),
        Divider(
          color: const Color.fromARGB(255, 181, 181, 181),
          thickness: 0.5,
          height: 20.0,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  },
),
// ...

            ),
          ),
        ],
      ),
    );
  }
}
