import 'package:blabla/data/repositories/locations/location_repository.dart';
import 'package:blabla/data/repositories/locations/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RidePreferenceRepositoryMock>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (_) =>
          RidePreferenceState(repository: RidePreferenceRepositoryMock()),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
