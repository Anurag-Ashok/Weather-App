import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: _getCurrentPosition(),
          builder: (context, snap) {
            if (snap.hasData) {
              return BlocProvider<WeatherBlocBloc>(
                create: (context) =>
                    WeatherBlocBloc()..add(FetchWeather(snap.data as Position)),
                child: const home_Screen(),
              );
            } else if (snap.hasError) {
              return Scaffold(
                body: Center(
                  child: Text('Error: ${snap.error}'),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ));
  }
}

Future<Position> _getCurrentPosition() async {
  final permission = await Geolocator.checkPermission();

  if (permission == null) {
    // Handle null permission status
    return Future.error('Unable to determine location permission status');
  }

  if (permission == LocationPermission.denied) {
    // Permission is denied, request permission
    final requestPermission = await Geolocator.requestPermission();
    if (requestPermission == LocationPermission.denied) {
      // Permission is still denied, handle appropriately
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately
    return Future.error('Location permissions are permanently denied');
  }

  try {
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  } catch (e) {
    // Handle any errors that occur during getCurrentPosition()
    return Future.error('Error getting current position: $e');
  }
}
