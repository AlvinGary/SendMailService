part of 'widgets.dart';

class UiLoading {
  static Container loading() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: SpinKitFadingCircle(
        size: 50,
        color: Colors.indigoAccent,
      ),
    );
  }

  static Container loadingBlock() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SpinKitFadingCircle(
        size: 50,
        color: Colors.indigoAccent,
      ),
    );
  }

  static Container loadingDD() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      color: Colors.transparent,
      child: SpinKitFadingCircle(
        size: 30,
        color: Colors.indigoAccent,
      ),
    );
  }
}
