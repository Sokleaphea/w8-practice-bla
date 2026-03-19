import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/services/ride_prefs_service.dart';
import 'package:blabla/ui/screens/home/view_model/home_model.dart';
import 'package:blabla/ui/screens/home/widgets/home_history_tile.dart';
import 'package:blabla/ui/screens/rides_selection/rides_selection_screen.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:blabla/ui/widgets/pickers/bla_ride_preference_picker.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

class HomeContent extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeContent({super.key, required this.viewModel});

  void _onRidePrefSelected(
    BuildContext context,
    RidePreference selectedPreference,
  ) async {
    viewModel.selectPreference(selectedPreference);
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildBackground(), _buildForeground(context)]);
  }

  @override
  Widget _buildForeground(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            "Your pick of rides at low price",
            style: BlaTextStyles.heading.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 100),

        Container(
          margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(16), // Rounded corners
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2 - THE FORM
              BlaRidePreferencePicker(
                initRidePreference: RidePrefsService.selectedPreference,
                onRidePreferenceSelected: (pref) =>
                    _onRidePrefSelected(context, pref),
              ),
              SizedBox(height: BlaSpacings.m),

              // 3 - THE HISTORY
              _buildHistory(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(BuildContext context) {
    final history = viewModel.history;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (ctx, index) => HomeHistoryTile(
          ridePref: history[index],
          onPressed: () => _onRidePrefSelected(context, history[index])
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
