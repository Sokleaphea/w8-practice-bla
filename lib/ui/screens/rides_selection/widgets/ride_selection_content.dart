import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';

class RideSelectionContent extends StatelessWidget {
  final RideSelectionModel viewModel;

  const RideSelectionContent({super.key, required this.viewModel});

  void onRideSelected(Ride ride) {
    // TODO: implement ride selection action
  }

  void onPreferencePressed(BuildContext context) async {
    final newPref = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createRightToLeftRoute(
        RidePreferenceModal(initialPreference: viewModel.currentPreference!),
      ),
    );

    if (newPref != null) {
      viewModel.selectPreference(newPref);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        final rides = viewModel.matchingRides;
        final pref = viewModel.currentPreference;

        if (pref == null) {
          return const Center(child: Text('No preference selected'));
        }

        return Column(
          children: [
            RideSelectionHeader(
              ridePreference: pref,
              onBackPressed: () => Navigator.pop(context),
              onFilterPressed: () {},
              onPreferencePressed: () => onPreferencePressed(context),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: rides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: rides[index],
                  onPressed: () => onRideSelected(rides[index]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}