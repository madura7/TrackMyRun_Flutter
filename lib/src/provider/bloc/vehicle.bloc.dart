import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:tracking_my_run/src/entity/entity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_my_run/src/provider/service/vehicle.service.dart';

class VehicleBloc extends BlocBase {
  final VehicleService _productService;

  VehicleBloc(this._productService) {
/*set list firebase in cache using pather bloc*/
    _loadVehicles();
  }

  final BehaviorSubject<List<VehicleEntity>> _listVehiclesController =
      new BehaviorSubject<List<VehicleEntity>>.seeded(List<VehicleEntity>());

  Observable<List<VehicleEntity>> get listVehiclesFlux =>
      _listVehiclesController.stream;

  Sink<List<VehicleEntity>> get listVehiclesEvent =>
      _listVehiclesController.sink;

  final BehaviorSubject<List<VehicleEntity>> _listVehiclesPopularController =
      new BehaviorSubject<List<VehicleEntity>>.seeded(List<VehicleEntity>());

  Observable<List<VehicleEntity>> get listVehiclesPopularFlux =>
      _listVehiclesPopularController.stream;

  Sink<List<VehicleEntity>> get listVehiclesPopularEvent =>
      _listVehiclesPopularController.sink;

  final BehaviorSubject<List<VehicleEntity>> _listVehiclesMyListController =
      new BehaviorSubject<List<VehicleEntity>>.seeded(List<VehicleEntity>());

  Observable<List<VehicleEntity>> get listVehiclesMyListFlux =>
      _listVehiclesMyListController.stream;

  Sink<List<VehicleEntity>> get listVehiclesMyListEvent =>
      _listVehiclesMyListController.sink;

  /*load list home page by type */
  _loadVehicles() async {
    print("_loadVehicles");
    listVehiclesEvent.add(await _productService.getByTypeAll('Car'));
    listVehiclesPopularEvent.add(await _productService.getByTypeAll('Van'));
    listVehiclesMyListEvent.add(await _productService.getByTypeAll('Bike'));
  }

  @override
  void dispose() {
    _listVehiclesController?.close();
    _listVehiclesPopularController?.close();
    _listVehiclesMyListController?.close();
    super.dispose();
  }
}
