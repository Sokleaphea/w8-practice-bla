import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  final List<RidePreference> _history = List.from(fakeRidePrefs);
  @override
  Future<List<RidePreference>> getHistory() async {
    return _history;
  }
  @override
  Future<void> savePreference(RidePreference preference) async {
    _history.add(preference);
  }
}
