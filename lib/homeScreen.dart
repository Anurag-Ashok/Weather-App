import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset("assets/1.png");
      case >= 300 && < 400:
        return Image.asset("assets/2.png");
      case >= 500 && < 600:
        return Image.asset("assets/3.png");
      case >= 600 && < 700:
        return Image.asset("assets/4.png");
      case >= 700 && < 800:
        return Image.asset("assets/5.png");
      case == 800:
        return Image.asset("assets/6.png");
      case >= 800 && < 804:
        return Image.asset("assets/7.png");
      default:
        return Image.asset("assets/7.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(1000, 45, 171, 227)),
                ),
              ),
              Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(
                      color: Color(0xffffAB40),
                    ),
                  )),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.weather.areaName}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Good Morning",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              "${state.weather.temperature!.celsius!.round()}°C",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 55),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              DateFormat("EEEE dd - ")
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/11.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sunrice",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/12.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sunset",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/13.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Max",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${state.weather.tempMax!.celsius!.round().toString()}°C",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/14.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Min",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${state.weather.tempMin!.celsius!.round().toString()}°C",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
