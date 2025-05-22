import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Foo {
  String bar(String input) => 'real';
}

class MockFoo extends Mock implements Foo {}

void main() {
  setUpAll(() {
    registerFallbackValue('dummy');
  });

  test('mocktail any<String>() matcher works with non-nullable argument', () async {
    final mockFoo = MockFoo();
    when(() => mockFoo.bar(any<String>())).thenReturn('mocked');
    final result = mockFoo.bar('hello');
    expect(result, 'mocked');
  });
} 