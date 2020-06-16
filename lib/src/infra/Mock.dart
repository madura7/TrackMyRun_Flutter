import 'package:tracking_my_run/src/entity/entity.dart';
import 'package:tracking_my_run/src/provider/service/vehicle.service.dart';

class Mock {


 static GenerateMock()async{


    VehicleService db = VehicleService();

    VehicleEntity movie = VehicleEntity(VehicleType: 'Car',
        VehicleNumber: 'NB0012',
        FuelType: 'Petrol',VehicleVideo: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/aladim.mp4',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/principal.jpg'),VehicleImages:List<ImageEntity>());

    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen1.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen2.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen3.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen4.jpg'));
    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Bike',VehicleNumber: 'B0110',FuelType:'Petrol',VehicleVideo: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/trailer.mp4',       
     VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/principal.jpg'),VehicleImages:List<ImageEntity>());

    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/1.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/2.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/3.jpg'));
    await db.save(movie);


    movie = VehicleEntity(VehicleType: 'Car',VehicleNumber: 'Featured1',FuelType:'Diesel',VehicleVideo: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/trailer.mp4',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/principal.jpg'),VehicleImages:List<ImageEntity>());

    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/1.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/2.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/3.jpg'));
    movie.VehicleImages.add(ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/4.jpg'));
    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Van',VehicleNumber: 'VN0152',FuelType:'Diesel',
              VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/1.jpg'),VehicleImages:List<ImageEntity>());

    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Car',VehicleNumber: 'V12401',FuelType:'Diesel',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/2.jpg'),VehicleImages:List<ImageEntity>());

    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Car',VehicleNumber: 'CS0010',FuelType:'Petrol',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/3.jpg'),VehicleImages:List<ImageEntity>());

    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Car',VehicleNumber: 'CS0011',FuelType:'Pertol',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/4.jpg'),VehicleImages:List<ImageEntity>());

    await db.save(movie);

    movie = VehicleEntity(VehicleType: 'Bike',VehicleNumber: 'BN0014',FuelType:'Petrol',
        VehicleImage: ImageEntity(Url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/5.jpg'),VehicleImages:List<ImageEntity>());

    await db.save(movie);

  }
}