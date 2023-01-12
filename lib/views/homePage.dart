import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'sideBarMenuWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _hoverColor = Colors.white;
  bool _filtersShown = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: SideBarMenuWidget(),
        // backgroundColor: Colors.blue,
        // appBar: AppBar(backgroundColor: Colors.blue),
        body: Builder(
          builder: (context) => Center(
            child: Stack(
              children: [
                // Flexible(
                FlutterMap(
                  options: MapOptions(
                    center: LatLng(49.842957, 24.031111),
                    zoom: 13,
                    minZoom: 10,
                    maxZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                  ],
                ),
                // ),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                // onTapDown: (details) {
                                //   setState(() {
                                //     _hoverColor = Colors.red;
                                //   });
                                // },
                                // onTapUp: (details) {
                                //   setState(() {
                                //     _hoverColor = Colors.white;
                                //   });
                                // },
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _hoverColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Image(
                                    image: AssetImage("images/menu.png"),
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("show filters");
                                  print(_filtersShown);
                                  setState(() {
                                    _filtersShown =
                                        _filtersShown ? false : true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _filtersShown
                                        ? Color(0xff48BB68)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(
                                            1, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Image(
                                    image: AssetImage("images/filter.png"),
                                    color: _filtersShown
                                        ? Colors.white
                                        : Colors.black,
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      );
}
