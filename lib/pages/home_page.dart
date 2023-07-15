import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smaet_homeui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //const padding
  final double paddinghorizental = 40;
  final double paddingvertical = 25;

  //list of smart devices
  List mySmartDevices = [
    //[smartDeviceName,iconPath,powerStatus]
    ['Smart Light','lib/images/light-bulb.png',true],
    ['Smart AC','lib/images/air-conditioner.png',true],
    ['Smart TV','lib/images/television.png',false],
    ['Smart Fan','lib/images/fan.png',false]
  ];

  //power button switched
  void powerSwitchChanged(bool value,int index){
    mySmartDevices[index][2] = value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: paddinghorizental, vertical: paddingvertical),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/images/menu.png',
                    height: 40,
                    color: Colors.grey[800],
                  ),
                  //account icon
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //welcome home MITCH Koko
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinghorizental),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome home',style: TextStyle(fontSize: 20,color: Colors.grey[700]),),
                  Text(
                    'MITCH Koko',
                    style: GoogleFonts.bebasNeue(fontSize: 72),

                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(color: Colors.grey[200],thickness: 1,),
            //smart devices+gird
            Padding(
              padding: EdgeInsets.symmetric(horizontal: paddinghorizental),
              child: Text('Smart Devices',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.grey[800]),),
            ),

            Expanded(
                child: GridView.builder(
                  itemCount: mySmartDevices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(25.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    childAspectRatio: 1/1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value)=> powerSwitchChanged(value,index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
