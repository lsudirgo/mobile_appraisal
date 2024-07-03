String getErrorMessage(Map<String, dynamic> jsonData, int statusCode) {
  String errorMessage;

  if (statusCode == 400) {
    final messageError = jsonData['message'];

    if (messageError is Map<String, dynamic>) {
      final name = messageError['name'];
      errorMessage = name ?? 'Unknown error occurred';
    } else if (messageError is List) {
      if (messageError.isNotEmpty) {
        errorMessage = messageError[0]; // Mengambil pesan pertama dari array
      } else {
        errorMessage = 'Unknown error occurred';
      }
    } else if (messageError is String) {
      errorMessage = messageError;
    } else {
      errorMessage = 'Unknown error format';
    }
  } else {
    errorMessage = jsonData['message'] ?? 'Unknown error occurred';
  }

  return errorMessage;
}
