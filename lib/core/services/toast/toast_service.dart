abstract class ToastService {
  Future<void> showSuccess(String message);
  Future<void> showError(String message);
  Future<void> showInfo(String message);
}

