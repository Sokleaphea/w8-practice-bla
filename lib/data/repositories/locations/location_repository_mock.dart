import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/locations/location_repository.dart';
import 'package:blabla/model/ride/locations.dart';

class LocationRepositoryMock implements LocationRepository {
  final List<Location> _location = fakeLocations;
  @override
  Future<List<Location>> availableLocations() async {
    return _location;
  }
}
