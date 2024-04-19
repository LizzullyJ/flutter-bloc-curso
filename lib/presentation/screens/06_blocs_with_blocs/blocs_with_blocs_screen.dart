import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final gelocoatioCubit = context.watch<GeolocationCubit>().state.location;
    final locationBloc = context.watch<HistoricLocationBloc>();
    final locationState = locationBloc.state;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Ubicaciones ${locationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: locationState.howManyLocations,
        itemBuilder: (context, index) {
          final location = locationState.locations[index];
          final (lat, lng) = location;
          return  ListTile(

            title: Text('Lat: $lat, Lng: $lng'),
          );
        
          return null;
          return null;},)
    );
  }
}