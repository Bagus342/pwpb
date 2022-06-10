import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pictpo/pages/add.dart';
import 'package:pictpo/pages/constants.dart';
import 'package:pictpo/pages/login.dart';
import 'package:pictpo/pages/profile.dart';
// import 'package:pictpo/model/content_model.dart';
// import 'package:pictpo/pages/login.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [const Home(), Add(), Profile()];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pict.Po', style: TextStyle(fontFamily: 'Poppins')),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Icon(Icons.logout, size: 26.0),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Add Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Profile()),
            //   );
            // },
          ),
        ],
      ),
      body: pages[activePage],
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: const BoxDecoration(color: mainColor),
                      child: const Text(
                        'asd',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
            // const Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Text(
            //     "Category",
            //     style: TextStyle(color: mainColor, fontSize: 18),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // CarouselSlider(
            //   options: CarouselOptions(height: 500.0),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //             width: MediaQuery.of(context).size.width,
            //             margin: const EdgeInsets.symmetric(horizontal: 5.0),
            //             decoration: const BoxDecoration(color: mainColor),
            //             child: Text(
            //               'text $i',
            //               style: const TextStyle(fontSize: 16.0),
            //             ));
            //       },
            //     );
            //   }).toList(),
            // )
            // ],
          ),
        ),
      ),
    );
  }
}
