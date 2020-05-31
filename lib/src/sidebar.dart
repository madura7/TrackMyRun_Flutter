import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_my_run/src/loginPage.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer, this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<LoginPage> _signOut() async {
      await FirebaseAuth.instance.signOut();
      print("Logout");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }

    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   "assets/rps_logo.png",
                  //   width: 100,
                  //   height: 100,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(userName)
                ],
              )),
          ListTile(
            onTap: () {
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.person),
            title: Text(
              "Your Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: Icon(Icons.payment),
            title: Text("Payments"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              //debugPrint("Tapped Log Out");
              _signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
