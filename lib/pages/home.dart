import 'package:barberapp/pages/booking.dart';
import 'package:barberapp/pages/booking_user.dart';
import 'package:barberapp/pages/hair.dart';
import 'package:barberapp/pages/myface.dart';
import 'package:barberapp/pages/viewmap.dart';
import 'package:barberapp/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name, image;

  Future<void> getthedatafromsharedpref() async {
    name = await SharedpreferenceHelper().getUserName();
    image = await SharedpreferenceHelper().getUserImage();
    setState(() {}); // เรียกใช้ setState หลังจากโหลดข้อมูลเสร็จ
  }

  Future<void> getontheload() async {
    await getthedatafromsharedpref();
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 72),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          color: Color.fromARGB(197, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      name ?? 'Guest',
                      style: TextStyle(
                          color: Color.fromARGB(197, 255, 255, 255),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: image != null
                      ? Image.network(
                          image!,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 60,
                          width: 60,
                          color: Colors.grey,
                          child: Icon(Icons.person,
                              color:
                                  Colors.white), // ใช้ไอคอนหาก image เป็น null
                        ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Divider(color: Colors.white30),
            SizedBox(height: 5),
            Text(
              "Services",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Hair(service: 'แนะนำทรงผม')));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/hair1.png",
                            height: 80,
                            width: 135,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "แนะนำทรงผม",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Myface(service: "แนะนำโครงหน้า")));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/face.png",
                            height: 80,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "แนะนำโครงหน้า",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: 'Hair Cutting')));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/hair_cutting.png",
                            height: 80,
                            width: 95,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "จองตัดผม",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: 'Hair Washing')));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/hair_washing.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "จองสระผม",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking_User(service: 'ข้อมูลการจอง')));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/booking.png",
                            height: 80,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "การจองของฉัน",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapSample(service: 'แผนที่')));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 50, 83, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/map.png",
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 1),
                          Text(
                            "เส้นทางร้าน",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
