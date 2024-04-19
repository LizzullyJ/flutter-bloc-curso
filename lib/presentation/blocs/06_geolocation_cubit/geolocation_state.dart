part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  final (double lat, double lng) location;
  final bool serviceEnabed;
  final bool permissionGranted;
  const GeolocationState({
    this.location = (0, 0),
    this.serviceEnabed = false,
    this.permissionGranted = false,
  });

  GeolocationState copyWith({
    (double lat, double lng)? location,
    bool? serviceEnabed,
    bool? permissionGranted,
  }) =>
      GeolocationState(
        location: location ?? this.location,
        serviceEnabed: serviceEnabed ?? this.serviceEnabed,
        permissionGranted: permissionGranted ?? this.permissionGranted,
      );

  @override
  List<Object> get props => [location, serviceEnabed, permissionGranted];
}
