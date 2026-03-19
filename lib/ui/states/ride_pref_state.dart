import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  final RidePreferenceRepository repository;

  RidePreference? _selectedPreference;
  List<RidePreference> _history = [];
  int maxAllowedSeats = 8;
  RidePreferenceState({required this.repository});
  List<RidePreference> get history => _history;

  RidePreference? get selectedPreference => _selectedPreference;

  Future<void> loadHistory() async {
    _history = await repository.getHistory();
    notifyListeners();
  }

  Future<void> selectPreference(RidePreference preference) async {
    if (preference == _selectedPreference) return;
    _selectedPreference = preference;

    await repository.savePreference(preference);
    _history = await repository.getHistory();
    notifyListeners();
  }
}
