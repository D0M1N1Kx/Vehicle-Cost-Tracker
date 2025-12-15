import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/config.dart';
import 'package:vehicle_cost_tracker_app/pages/garage_page.dart';
import 'package:vehicle_cost_tracker_app/widgets/button_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonCard(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => GaragePage()));
              },
              icon: Icons.garage,
              iconColor: Colors.blue,
              title: 'Garage',
              subtitle: 'Managing and modifying your cars',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.notifications_active,
              iconColor: Colors.yellow,
              title: 'Maintenance reminder',
              subtitle: 'Recorded statuses and due dates',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.local_gas_station_sharp,
              iconColor: Colors.green,
              title: 'Refueling log',
              subtitle: 'Tracking monthly fuel costs',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.edit_document,
              iconColor: Colors.indigo,
              title: 'Service log',
              subtitle: 'Repairs carried out and their costs',
            ),
            SizedBox(height: 20),
            ButtonCard(
              onTap: () {},
              icon: Icons.settings,
              iconColor: Colors.grey,
              title: 'Settings',
              subtitle: 'Import, export and other options',
            ),
          ],
        ),
      ),
    );
  }
}
