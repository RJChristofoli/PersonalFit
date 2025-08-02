//INTERFACE FOR REQ

class Output {
  final bool success;
  final String message;
  final dynamic data;
  final int statusCode;

  Output({
    required this.success,
    required this.message,
     this.data,
    required this.statusCode,
  });
}