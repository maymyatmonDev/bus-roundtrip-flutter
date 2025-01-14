import 'package:bus_roundtrip_flutter/models/bus_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BusResult extends StatefulWidget {
  @override
  _BusResultState createState() => _BusResultState();
}

class _BusResultState extends State<BusResult> {
  List<BusListModel> busList = [];
  BusListModel? selectedBus;

  void _getBusList() {
    busList = BusListModel.getBusList();
  }

  void handleSelect(busInfo) {
    setState(() {
      selectedBus = BusListModel(
        operatorName: busInfo.operatorName,
        logo: busInfo.logo,
        rating: busInfo.rating,
        review: busInfo.review,
        seats: busInfo.seats,
        gates: busInfo.gates,
        price: busInfo.price,
        date: busInfo.date,
        from: busInfo.from,
        fromTime: busInfo.fromTime,
        to: busInfo.to,
        toTime: busInfo.toTime,
        duration: busInfo.duration,
      );
    });
  }

  void handleRemove() {
    setState(() => selectedBus = null);
  }

  @override
  Widget build(BuildContext context) {
    _getBusList();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedBus != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            'Selected Departure',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff00AEEF)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff1D1617).withOpacity(.07),
                                  offset: Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Operator Name Section (Full Width)
                                  Row(
                                    children: [
                                      Image.asset(
                                        selectedBus?.logo ?? '',
                                        width: 50,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        selectedBus?.operatorName ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: 10), // Space after operator name

                                  // Route and Button in a Row
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Left Side: Route Details
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${selectedBus?.date ?? ''} (${selectedBus?.fromTime ?? ''} - ${selectedBus?.toTime ?? ''})',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        selectedBus?.from ?? '',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Image.asset(
                                                        'assets/icons/from-to-small.png',
                                                        width: 15,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        selectedBus?.to ?? '',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Right Side: Select Button
                                        Expanded(
                                          flex: 1,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff00AEEF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              fixedSize: Size(80, 40),
                                              padding: EdgeInsets.zero,
                                            ),
                                            onPressed: () {
                                              handleRemove();
                                            },
                                            child: Text(
                                              'Change',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  selectedBus != null ? 'Return Trip' : 'Departure Trip',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 25),
                itemCount: busList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(.07),
                          offset: Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 15, bottom: 15, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Operator Name Section (Full Width)
                          Row(
                            children: [
                              Image.asset(
                                busList[index].logo ?? '',
                                width: 50,
                              ),
                              SizedBox(width: 10),
                              Text(
                                busList[index].operatorName ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15), // Space after operator name

                          // Route and Button in a Row
                          Expanded(
                            child: Row(
                              children: [
                                // Left Side: Route Details
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${busList[index].from ?? ''} (${busList[index].fromTime ?? ''})',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        busList[index].gates ?? '',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff828282),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        busList[index].duration ?? '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff4F4F4F),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        '${busList[index].to ?? ''} (${busList[index].toTime ?? ''})',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        busList[index].gates ?? '',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff828282),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      // Rating Stars Section
                                      Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                              (busList[index].rating ?? 0.0)
                                                  .toInt(), // Use the rating value to generate the correct number of stars
                                              (starIndex) {
                                                return Image.asset(
                                                  'assets/icons/star-icon.png',
                                                  width: 10,
                                                );
                                              },
                                            ),
                                          ),
                                          Text(
                                            ' (${busList[index].review ?? ''} Reviews) Free Wifi, Aircon',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff4F4F4F),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Vertical Divider between the Route and Button
                                Container(
                                  height:
                                      100, // Adjust this to control the height of the divider
                                  width: 1, // Line thickness
                                  color: Color(0xff707070)
                                      .withOpacity(.2), // Divider color
                                ),

                                // Right Side: Select Button
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 45),
                                          Text(
                                            'MMK ${busList[index].price ?? ''}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff00AEEF)),
                                          ),
                                          SizedBox(height: 5),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff00AEEF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              fixedSize: Size(80, 40),
                                              padding: EdgeInsets.zero,
                                            ),
                                            onPressed: () {
                                              // Get the busList[index]'s info values
                                              dynamic busInfo = busList[index];

                                              // Call a function to log the values
                                              handleSelect(busInfo);
                                            },
                                            child: Text(
                                              'Select',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '${busList[index].seats ?? ''} Seats',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ]));
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Bus',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              width: 20, height: 20),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child:
                SvgPicture.asset('assets/icons/dots.svg', width: 5, height: 5),
          ),
        )
      ],
    );
  }
}
