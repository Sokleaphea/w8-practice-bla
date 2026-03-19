import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final RidePreferenceState rideState;
  HomeViewModel({required this.rideState}) {
    rideState.addListener(_onRideStateChanged);
  }
  RidePreference? get selectedPreference => rideState.selectedPreference;

  List<RidePreference> get history => rideState.history.reversed.toList();

  void selectPreference(RidePreference pref) {
    rideState.selectPreference(pref);
  }

  void _onRideStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    rideState.removeListener(_onRideStateChanged);
    super.dispose();
  }
}
