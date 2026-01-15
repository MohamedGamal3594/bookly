import 'package:dio/dio.dart';

extension ExceptionExtension on Object {
  String toErrorMessage() {
    if (this is DioException) {
      final dioError = this as DioException;
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timed out. Please check your internet.";
        case DioExceptionType.sendTimeout:
          return "Send timeout in association with server.";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with server.";
        case DioExceptionType.badResponse:
          return _handleStatusCode(dioError.response?.statusCode);
        case DioExceptionType.cancel:
          return "Request to server was cancelled.";
        case DioExceptionType.connectionError:
          return "No internet connection.";
        default:
          return "Something went wrong. Please try again.";
      }
    }
    return "Unexpected error occurred.";
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request.";
      case 401:
        return "Unauthorized access.";
      case 403:
        return "The requested resource is forbidden.";
      case 404:
        return "The requested resource was not found.";
      case 500:
        return "Internal server error.";
      default:
        return "Oops! Something went wrong.";
    }
  }
}
