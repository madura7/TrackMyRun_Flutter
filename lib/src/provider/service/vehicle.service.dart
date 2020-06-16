import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracking_my_run/src/entity/entity.dart';

class VehicleService {
  static final String _baseUrl = 'Vehicles';

  final CollectionReference _db;

  VehicleService() : _db = Firestore.instance.collection(_baseUrl);

/*add or update item*/
  Future<VehicleEntity> save(VehicleEntity entity) async {
    if (entity.Id == null) entity.Id = _db.document().documentID;

    await _db.document(entity.Id).setData(entity.toJson());
    return entity;
  }

  Future<List<VehicleEntity>> getByTypeAll(String type) async {
    print("getByTypeAll");
    final CollectionReference _dbs = Firestore.instance.collection(_baseUrl);
    QuerySnapshot query =
        await _dbs.where("VehicleType", isEqualTo: type).getDocuments();
    List<VehicleEntity> products = query.documents
        .map((doc) => VehicleEntity.fromSnapshotJson(doc))
        .toList();
        print(products);
    return products;
  }
}
