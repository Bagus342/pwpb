import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pictpo/pages/edit_profile.dart';
import 'package:pictpo/pages/login.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _getUsername() {
    final String? username = auth.currentUser?.displayName;
    return username;
  }

  String? _getEmail() {
    final String? email = auth.currentUser?.email;
    return email;
  }

  FirebaseFirestore fireInstance = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> refreshUserData() async {
    // print(fireInstance.app);
    // final result = (await users.get()).docs;
    // print(result);
    // FirebaseFirestore.instance.collection('images').limit(1).get().then((_) {
    //   print(_.docs);
    // });
    User user = FirebaseAuth.instance.currentUser!;
  }

  @override
  void initState() {
    refreshUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          const SizedBox(
            height: 20,
          ),
          _profileName(_getUsername()),
          const SizedBox(
            height: 14,
          ),
          _heading("Personal"),
          const SizedBox(
            height: 6,
          ),
          _detailsCard(_getEmail()),
          const SizedBox(
            height: 10,
          ),
          _heading("Others"),
          const SizedBox(
            height: 6,
          ),
          _settingsCard(),
          const Spacer(),
          logoutButton()
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2lnAGj0R7cevNADW0_mjUIKaG9y1rYGHe4Q&usqp=CAU"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String? name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name ?? '',
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard(String? email) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: Icon(Icons.email),
          title: Text(email ?? ''),
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: const [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help Center"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize),
              title: Text("About Us"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditProfile()));
      },
      child: Container(
          color: Colors.deepPurple,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
