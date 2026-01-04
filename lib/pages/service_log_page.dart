import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/service_view_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ServiceViewModel(_car),
      builder: (context, child) {
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
                                context
                                    .read<ServiceViewModel>()
                                    .allServicesAndRefuelsCount
                                    .toString(),
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
                                context
                                    .read<ServiceViewModel>()
                                    .totalCosts
                                    .toString(),
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
                          backgroundColor: WidgetStateProperty.all(
                            Colors.orange,
                          ),
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
      },
    );
  }
}
