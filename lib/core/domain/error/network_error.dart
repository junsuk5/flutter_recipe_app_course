import 'error.dart';

enum NetworkError implements Error {
  requestTimeout,
  noInternet,
  serverError,
  unknown;

  @override
  String toString() {
    return switch(this) {
      NetworkError.requestTimeout => '요청 시간이 초과되었습니다',
      NetworkError.noInternet => '인터넷 연결을 확인해 주세요',
      NetworkError.serverError => '서버에 문제가 발생했습니다',
      NetworkError.unknown => '알 수 없는 문제가 발생했습니다',
    };
  }
}