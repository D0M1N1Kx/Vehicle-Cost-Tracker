import 'package:flutter/material.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';

class ServiceLogPage extends StatefulWidget {
  final Vehicle vehicle;
  const ServiceLogPage({required this.vehicle, super.key});

  @override
  State<ServiceLogPage> createState() => _ServiceLogPageState();
}

class _ServiceLogPageState extends State<ServiceLogPage> {
  late Vehicle _car;

  @override
  void initState() {
    super.initState();
    _car = widget.vehicle;
  }

  int get totalAllCosts {
    int total = 0;

    // Szervizek összeadása (biztonságos null-kezeléssel)
    if (_car.services != null) {
      for (var service in _car.services!) {
        total += service.cost;
      }
    }

    // Tankolások összeadása (ha a Refuel osztályban 'cost' a mező neve)
    if (_car.refuels != null) {
      for (var refuel in _car.refuels!) {
        // Itt figyeltem a képeden: ha a Refuel-nél 'fuelCost' vagy 'cost' a neve, azt használd!
        total += refuel.fuelCost;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: ListTile(
          title: Text(
            '${_car.brand} ${_car.modell}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text('Service Log'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 2.0,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.build_circle_outlined,
                            color: Colors.orange,
                          ),
                          Text(
                            (_car.services?.length ?? 0).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('All services'),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Icon(Icons.wallet, color: Colors.lightGreen),
                          Text(
                            totalAllCosts.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('All costs'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.orange),
                    ),
                    child: Text(
                      '+ New service log',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
