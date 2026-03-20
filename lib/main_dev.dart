import 'package:blabla/data/repositories/locations/location_repository.dart';
import 'package:blabla/data/repositories/locations/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main_common.dart';
import 'package:blabla/ui/screens/home/view_model/home_model.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/rides_selection_model.dart';
import 'package:blabla/ui/states/ride_pref_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get devProviders {
  return [
    Provider<LocationRepository>(create: (_) => LocationRepositoryMock()),
    Provider<RideRepository>(create: (_) => RideRepositoryMock()),
    Provider<RidePreferenceRepositoryMock>(
      create: (_) => RidePreferenceRepositoryMock(),
    ),
    ChangeNotifierProvider<RidePreferenceState>(create: (context) => RidePreferenceState(repository: context.read<RidePreferenceRepositoryMock>())),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel(rideState: context.read<RidePreferenceState>())),
    ChangeNotifierProvider<RideSelectionModel>(create: (context) => RideSelectionModel(rideRepo: context.read<RideRepository>(), rideState: context.read<RidePreferenceState>()))
  ];
}

void main() {
  mainCommon(devProviders);
}
