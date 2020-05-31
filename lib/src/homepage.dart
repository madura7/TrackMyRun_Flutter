import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:tracking_my_run/src/sidebar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

String userName1 = "User Name";
FSBStatus drawerStatus;

class _HomePageState extends State<HomeScreen> {
  Future<FirebaseUser> getUser() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    return await _firebaseAuth.currentUser();
  }

  getLoggedInUser() {
    getUser().then((user) {
      userName1 = user.email.toString();
      setState(() {
        userName1 = user.email.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.deepOrange,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
            userName: userName1,
          ),
          screenContents: buildList(),
          status: drawerStatus,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              getLoggedInUser();
              print(userName1);
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
      ),
    );
  }
}

class buildList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[200],
      child: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('Vehicle').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildList(context, snapshot.data.documents);
    },
  ));
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Record.fromSnapshot(data);

  return Padding(
    key: ValueKey(record.VehicleNo),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.yellowAccent[100],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        leading: Image.network(
          record.imageURL,
          width: 50,
        ),
        title: Text(record.VehicleNo),
        trailing: Text(record.VehicleType),
        //onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),
      ),
    ),
  );
}

class Record {
  final String VehicleNo;
  final String VehicleType;
  final String imageURL;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['VehicleNo'] != null),
        assert(map['VehicleType'] != null),
        assert(map['imageURL'] != null),
        VehicleNo = map['VehicleNo'],
        VehicleType = map['VehicleType'],
        imageURL = map['imageURL'].toString();

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$VehicleNo:$VehicleType>";
}
