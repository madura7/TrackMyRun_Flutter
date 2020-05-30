import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirstScreen extends StatelessWidget {
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
    body:StreamBuilder<QuerySnapshot>(
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
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
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['VehicleNo'] != null),
        assert(map['VehicleType'] != null),
        VehicleNo = map['VehicleNo'],
        VehicleType = map['VehicleType'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$VehicleNo:$VehicleType>";
}
