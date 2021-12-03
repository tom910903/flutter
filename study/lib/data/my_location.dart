import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyLocation{
  double latitude2 = 0;
  double longitude2 = 0;

  Future<void> getMyCurrentLocation() async{

    Map<Permission, PermissionStatus> permissions = await [Permission.locationWhenInUse].request();

    try {
      if (permissions[Permission.locationWhenInUse] ==
          PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude2 = position.latitude;
        longitude2 = position.longitude;
      }
    }catch(e){
      print('Error!!!');
    }
  }
}