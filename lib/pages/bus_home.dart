import 'package:bus_roundtrip_flutter/pages/bus_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class BusSearchHome extends StatefulWidget {
  const BusSearchHome({super.key});

  @override
  State<BusSearchHome> createState() => _BusSearchHomeState();
}

class _BusSearchHomeState extends State<BusSearchHome> {
  // State variables
  bool isMyanmarCitizen = true;
  String tripType = "Roundtrip"; // Default: Roundtrip
  int passengerCount = 1;
  DateTime? departureDate;
  DateTime? returnDate;

  // TextEditingControllers for 'From' and 'To' fields
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    departureDate = DateTime.now();
    returnDate = departureDate?.add(Duration(days: 1));
  }

  // Method to dispose controllers
  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  Future<void> selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Color(0xff00AEEF), // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xff00AEEF), // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
          returnDate = departureDate?.add(Duration(days: 1));
        } else {
          returnDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Bus Travel',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff00AEEF))),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1D1617).withOpacity(.07),
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Myanmar Citizen',
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: isMyanmarCitizen,
                          activeColor: Color(0xff00AEEF),
                          fillColor:
                              MaterialStateProperty.all(Color(0xff00AEEF)),
                          onChanged: (value) {
                            setState(() {
                              isMyanmarCitizen = value!;
                            });
                          },
                        ),
                        Text('Yes'),
                        SizedBox(width: 10),
                        Radio(
                          value: false,
                          groupValue: isMyanmarCitizen,
                          activeColor: Color(0xff00AEEF),
                          fillColor:
                              MaterialStateProperty.all(Color(0xff00AEEF)),
                          onChanged: (value) {
                            setState(() {
                              isMyanmarCitizen = value!;
                            });
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20), // Spacing
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1D1617).withOpacity(.07),
                    offset: Offset(0, 10),
                    blurRadius: 40,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SizedBox(height: 2),
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(fontSize: 14),
                    controller: fromController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'From',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff333333),
                        size: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xff707070).withOpacity(.1),
                  ),
                  SizedBox(height: 2),
                  TextField(
                    style: TextStyle(fontSize: 14),
                    textAlignVertical: TextAlignVertical.center,
                    textCapitalization: TextCapitalization.words,
                    controller: toController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'To',
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff333333),
                        size: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xff707070).withOpacity(.1),
                  ),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: () => selectDate(context, true),
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color: Color(0xff333333), size: 18),
                          SizedBox(width: 10),
                          Text(
                            DateFormat('EEEE, MMMM dd').format(departureDate!),
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff333333)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xff707070).withOpacity(.1),
                  ),
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: tripType == "Roundtrip"
                        ? () => selectDate(context, false)
                        : null,
                    child: Container(
                      color: tripType == "Oneway"
                          ? Colors.grey.withOpacity(.1)
                          : Colors.transparent,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      child: Row(children: [
                        Icon(Icons.calendar_today,
                            color: tripType == "Oneway"
                                ? Colors.grey
                                : Color(0xff333333),
                            size: 18),
                        SizedBox(width: 10),
                        Text(
                          DateFormat('EEEE, MMMM dd').format(returnDate!),
                          style: TextStyle(
                              fontSize: 14,
                              color: tripType == "Oneway"
                                  ? Colors.grey
                                  : Color(0xff333333)),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xff707070).withOpacity(.1),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Radio(
                        value: 'Oneway',
                        groupValue: tripType,
                        activeColor: Color(0xff00AEEF),
                        fillColor: MaterialStateProperty.all(Color(0xff00AEEF)),
                        onChanged: (value) {
                          setState(() {
                            tripType = 'Oneway';
                          });
                        },
                      ),
                      Text('Oneway'),
                      SizedBox(width: 10),
                      Radio(
                        value: 'Roundtrip',
                        groupValue: tripType,
                        activeColor: Color(0xff00AEEF),
                        fillColor: MaterialStateProperty.all(Color(0xff00AEEF)),
                        onChanged: (value) {
                          setState(() {
                            tripType = 'Roundtrip';
                          });
                        },
                      ),
                      Text('Roundtrip'),
                    ],
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 5, top: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1D1617).withOpacity(.07),
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(Icons.person_2_outlined,
                              color: tripType == "Oneway"
                                  ? Colors.grey
                                  : Color(0xff333333),
                              size: 16),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${passengerCount.toString()} Adult',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale:
                              0.8, // Adjust this value to change the size of the button
                          child: IconButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffF2F4F7)),
                            ),
                            padding: EdgeInsets.all(10),
                            icon: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            onPressed: () {
                              if (passengerCount > 1) {
                                setState(() {
                                  passengerCount--;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          passengerCount.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Transform.scale(
                          scale:
                              0.8, // Adjust this value to change the size of the button
                          child: IconButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffF2F4F7)),
                            ),
                            padding: EdgeInsets.all(10),
                            icon: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            onPressed: () {
                              setState(() {
                                passengerCount++;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    backgroundColor: Color(0xff00AEEF)),
                onPressed: () {
                  // print('Myanmar Citizen: $isMyanmarCitizen');
                  // print('From: ${fromController.text}');
                  // print('To: ${toController.text}');
                  // print('Departure Date: $departureDate');
                  // print('Return Date: $returnDate');
                  // print('Trip Type: $tripType');
                  // print('Passengers: $passengerCount');
                  if (fromController.text != '' || toController.text != '') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusResult(
                          isMyanmarCitizen: isMyanmarCitizen,
                          from: fromController.text,
                          to: toController.text,
                          departureDate: departureDate,
                          returnDate: returnDate,
                          tripType: tripType,
                          passengerCount: passengerCount,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Search',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Flymya',
        style: TextStyle(
            color: Color(0xff6F7789),
            fontSize: 18,
            fontWeight: FontWeight.bold),
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
              // color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/icons/menu.png',
            width: 18,
            height: 18,
          ),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                'assets/icons/flag.png',
                width: 22,
                height: 22,
              ),
            ))
      ],
    );
  }
}
