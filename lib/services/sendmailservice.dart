part of "services.dart";

class SendEmailService {
  static Future<http.Response> sendEmail(String mail) {
    return http.post(
        Uri.https('alvin01.com', '/cirestapi/index.php/api/mahasiswa/sendmail'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'AFL-API-KEY': 'AFL-CloudComp2022',
        },
        body: jsonEncode(<String, dynamic>{
          'email': mail,
        }));
  }
}
