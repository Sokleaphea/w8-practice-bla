import 'package:blabla/data/dummy_data.dart';
import 'package:blabla/data/repositories/ride/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

class RideRepositoryMock implements RideRepository {
  final List<Ride> _rides = fakeRides;
  @override
  Future<List<Ride>> getRideFor(RidePreference preferences) async {
    return _rides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }

  @override
  Future<List<Ride>> getAllRides() async {
    return _rides;
  }
}
