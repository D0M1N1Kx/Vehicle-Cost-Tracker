import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_cost_tracker_app/l10n/app_localizations.dart';
import 'package:vehicle_cost_tracker_app/models/vehicle.dart';
import 'package:vehicle_cost_tracker_app/pages/add_vehicle_page.dart';
import 'package:vehicle_cost_tracker_app/services/vehicle_repository.dart';
import 'package:vehicle_cost_tracker_app/viewmodels/garage_view_model.dart';
import 'package:vehicle_cost_tracker_app/widgets/empty_garage.dart';
import 'package:vehicle_cost_tracker_app/widgets/vehicle_list.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GarageViewModel()..loadVehicles(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.garage),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final Vehicle? newVehicle = await Navigator.of(context)
                  .push<Vehicle>(
                    MaterialPageRoute(builder: (context) => AddVehiclePage()),
                  );
              if (newVehicle != null && context.mounted) {
                context.read<GarageViewModel>().addVehicle(newVehicle);
              }
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 36),
            child: Consumer<GarageViewModel>(
              builder: (context, viewModel, _) {
                if (viewModel.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                final bool isGarageEmpty = viewModel.isEmpty;

                return Column(
                  mainAxisAlignment: isGarageEmpty
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isGarageEmpty
                        ? EmptyGarage()
                        : VehicleList(
                            cars: viewModel.vehicles,
                            onDelete: (int id) {
                              context.read<GarageViewModel>().deleteVehicle(id);
                            },
                            onEdit: (Vehicle edited) {
                              context.read<GarageViewModel>().editVehicle(
                                edited,
                              );
                            },
                          ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
