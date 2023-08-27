

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('method not found');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error,please try again');
    } else {
      return ServerFailure('Oops there is an error,please try again');
    }
  }
}
