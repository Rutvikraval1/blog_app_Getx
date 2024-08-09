
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../Flutter_toast_mes.dart';


class Get_GPS_Location {
  LocationPermission? permission;
  Position? position;
  String long = "", lat = "";
  String Address = "";


  Future? determinePosition() async {
    bool serviceEnabled;
    bool LocationSettings;
    print("step 1");
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print("step 2");
    print(serviceEnabled);
    if (!serviceEnabled) {
      print("step 3");
      print(serviceEnabled);
      LocationSettings = await Geolocator.openLocationSettings();
      print("step 4");
      print(LocationSettings);
      // return LocationSettings;
      return Flutter_toast_mes().Error_Message('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    print("step 5");
    print(permission);
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("step 6");
      print(permission);
      permission = await Geolocator.requestPermission();
      print("step 7");
      print(permission);
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        print("step 8");
        print(permission);
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        long = position!.longitude.toString();
        lat = position!.latitude.toString();
        Address = await GetAddressFromLatLong(position!);
        Map Location_get = {'lat': lat, 'long': long, 'Address': Address};

        print("zczx");
        print(long);
        print(lat);
        print(Address);
        return Location_get;
      }else{
        Map Location_get = {'lat': lat, 'long': long, 'Address': Address};
        return Location_get;
      }
    } else {
      // position = await Geolocator.getLastKnownPosition();
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      if(position!=null){
        long = position!.longitude.toString();
        lat = position!.latitude.toString();
        Address = await GetAddressFromLatLong(position!);
        Map Location_get = {'lat': lat, 'long': long, 'Address': Address};
        return Location_get;
      }
    }
  }

  Future<String> GetAddressFromLatLong(Position position) async {
    print("step 17");
    print(position);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude,localeIdentifier: 'en');

    Placemark place = placemarks[0];
    Address ='${place.country}';
        // '${place.street}, ${place.subLocality}, ${place.isoCountryCode}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print("step 18");
    print(Address);
    return Address;
  }
}
