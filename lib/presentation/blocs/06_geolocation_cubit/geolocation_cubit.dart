import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
//*inyeccion de dependencia
  final void Function((double lat, double lng) location)?
      onNewUserLocationCallback;

  GeolocationCubit({this.onNewUserLocationCallback})
      : super(const GeolocationState());

  Future<void> checkStatus() async {
//*Verificar geolocation y permissions
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      serviceEnabed: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.always ||
          permissionGranted == LocationPermission.whileInUse,
    ));
  }

  Future<void> watchUserLocation() async {
    //obtener la ubicacion del usuario

    await checkStatus();
    if (!state.permissionGranted || !state.serviceEnabed) return;
    const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 15);

    Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((position) {
      final newLocation = (position.latitude, position.longitude);
      //*aqui ya sabemos la ubicacion del usuario
      emit(state.copyWith(location: newLocation));
      onNewUserLocationCallback?.call(newLocation);
    });
  }
}
