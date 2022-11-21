part of 'widgets.dart';

class UiToast {
  BuildContext? context;

  UiToast(BuildContext ctx) {
    context = ctx;
  }

  // Fluttertoast.showToast(
  //   msg:
  //       "Origin dan atau Destination masih belum diset!",
  //   toastLength: Toast.LENGTH_SHORT,
  //   fontSize: 14,
  //   backgroundColor:
  //       Color.fromARGB(255, 255, 0, 0),
  //   textColor: Colors.white,
  // );

  // Fluttertoast.showToast(
  //   msg: "Origin: " +
  //       selectedCity.cityName +
  //       ", Destination: " +
  //       selectedCity2.cityName,
  //   toastLength: Toast.LENGTH_SHORT,
  //   fontSize: 14,
  //   backgroundColor: Colors.greenAccent,
  //   textColor: Colors.white,
  // );

  static void toastOk(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14);
  }

  static void toastErr(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14);
  }

  static void toastWarning(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 14);
  }
}
