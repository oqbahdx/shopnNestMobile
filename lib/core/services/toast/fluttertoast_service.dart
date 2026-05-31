import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'toast_service.dart';

@LazySingleton(as: ToastService)
class FluttertoastService implements ToastService {
  @override
  Future<void> showError(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Future<void> showInfo(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Future<void> showSuccess(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}

