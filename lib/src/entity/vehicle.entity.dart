import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'image.entity.dart';

class VehicleEntity {
  String Id;
  String VehicleNumber;
  String VehicleType;
  String FuelType;
  String VehicleVideo;
  List<ImageEntity> VehicleImages;
  ImageEntity VehicleImage;
  DateTime CreatedIn;
  DateTime ModifiedIn;

  VehicleEntity(
      {this.Id,
      this.VehicleNumber,
      this.VehicleType,
      this.FuelType,
      this.VehicleVideo,
      this.VehicleImage,
      this.VehicleImages,
      this.CreatedIn,
      this.ModifiedIn});

  VehicleEntity.fromSnapshotJson(DocumentSnapshot snapshot)
      : this.Id = snapshot.documentID,
        this.VehicleNumber = snapshot.data["VehicleNumber"],
        this.VehicleType = snapshot.data["VehicleType"],
        this.FuelType = snapshot.data["FuelType"],
        this.VehicleVideo = snapshot.data["VehicleVideo"],
        this.VehicleImage = ImageEntity.fromMap(snapshot['VehicleImage']),
        this.VehicleImages =
            snapshot.data["VehicleImages"].map<ImageEntity>((item) {
          return ImageEntity.fromMap(item);
        }).toList(),
        this.CreatedIn = snapshot.data['CreatedIn'].toDate(),
        this.ModifiedIn = snapshot.data['ModifiedIn'].toDate();

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      "Id": this.Id,
      "VehicleNumber": this.VehicleNumber,
      "VehicleType": this.VehicleType,
      "FuelType": this.FuelType,
      "VehicleVideo": this.VehicleVideo,
      'VehicleImage':
          this.VehicleImage == null ? ImageEntity() : this.VehicleImage.toJson(),
      "VehicleImages": this.VehicleImages == null
          ? List<ImageEntity>()
          : this.VehicleImages.map((i) => i.toJson()).toList(),
      "CreatedIn": this.CreatedIn == null ? DateTime.now() : this.CreatedIn,
      "ModifiedIn": this.CreatedIn == null ? DateTime.now() : this.CreatedIn,
    };
  }
}
