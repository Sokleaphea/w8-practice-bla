import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:flutter/material.dart';

class RideSelectionModel extends ChangeNotifier {
  final RidePreferenceState rideState;
  final RideRepository rideRepo;

  RideSelectionModel({required this.rideRepo, required this.rideState}) {
    rideState.addListener(_onPreferenceChanged);
    _loadRides();
  }

  RidePreference? get currentPreference => rideState.selectedPreference;
  List<Ride> _matchingRides = [];
  List<Ride> get matchingRides => _matchingRides;
  void _loadRides() async {
    final pref = rideState.selectedPreference;

    if (pref == null) {
      _matchingRides = [];
      notifyListeners();
      return;
    }
    _matchingRides = await rideRepo.getRideFor(pref);
    // if (pref != null) {
    //   _matchingRides = await rideRepo.getRideFor(pref);
    // } else {
    //   _matchingRides = [];
    // }
    notifyListeners();
  }

  void _onPreferenceChanged() {
    _loadRides();
  }

  void selectPreference(RidePreference pref) {
    rideState.selectPreference(pref);
  }

  @override
  void dispose() {
    rideState.removeListener(_onPreferenceChanged);
    super.dispose();
  }
}
