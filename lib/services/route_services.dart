import 'package:liveroute_driver/services/services.dart';

class RouteServices {
  static Future<List<Map<String, dynamic>>> getRoutes() async {
    final res = kAllRoutesSuccess;
    if (res['response'] == null || res['response'] != 'success') {
      throw Exception('Failed to fetch routes');
    } else if (res['body'] == null) {
      throw Exception('No body routes found');
    } else {
      final successBody = res['body'] as Map<String, dynamic>;

      if (successBody['routes'] == null) {
        throw Exception('No routes found');
      } else {
        final routes = List<Map<String, dynamic>>.from(successBody['routes']);
        return routes;
      }
    }
  }
}
