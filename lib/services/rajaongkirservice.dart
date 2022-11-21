part of "services.dart";

class RajaOngkirService {
  static Future<http.Response> getOngkir() {
    return http.post(Uri.https(Const.BASE_URL, '/starter/cost'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'key': Const.API
        },
        body: jsonEncode(<String, dynamic>{
          'origin': '120',
          'destination': '300',
          'weight': 1000,
          'courier': 'jne'
        }));
  }

  static Future<List<Costs>> getMyOngkir(
      dynamic ori, dynamic des, int weight, dynamic courier) async {
    var response = await http.post(Uri.https(Const.BASE_URL, '/starter/cost'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'key': Const.API
        },
        body: jsonEncode(<String, dynamic>{
          'origin': ori,
          'destination': des,
          'weight': weight,
          'courier': courier
        }));

    var job = json.decode(response.body);
    List<Costs> costs = [];

    if (response.statusCode == 200) {
      costs = (job['rajaongkir']['results'][0]['costs'] as List)
          .map((e) => Costs.fromJson(e))
          .toList();
    }

    return costs;
  }
}
