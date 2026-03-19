import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class RidePreferenceRepository {
  Future<void> savePreference(RidePreference preference);
  Future<List<RidePreference>> getHistory();
}
