import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  Dio dio;

  setUpAll(() {
    dio = MockDio();
  });

  test('getRoomWithUserId', () async {
    when(dio.post<String>(
      any,
      data: anyNamed,
    )).thenAnswer((_) {
      return Future.value(Response(data: ''));
    });
  }, skip: true);
}
