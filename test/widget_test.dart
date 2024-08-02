import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stockquote/utils/const.dart';
import 'package:test/test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([http.Client])
@GenerateMocks([WebSocketChannel])
void main() {
  group('searchStock', () {
    test('should return stock search data on successful API call', () async {
      // Arrange
      final client = MockClient();
      const query = 'AAPL';
      final url = "$baseUrl/search/?q=$query&token=$token";
      final mockResponseData = {
        'count': 30,
        'result': [
          {
            'type': 'Common Stock',
            'description': 'APPLE INC',
            'displaySymbol': 'AAPL',
            'symbol': 'AAPL',
          },
        ],
      };

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => http.Response(json.encode(mockResponseData), 200),
      );

      // Act
      final response = await client.get(Uri.parse(url));
      final data = json.decode(response.body);

      // Assert
      expect(response.statusCode, 200);
      expect(data['count'], 30);
      expect(data['result'], isNotEmpty);
      expect(data['result'][0]['description'], 'APPLE INC');
    });

    test(
        'should return error message on API failure (500 Internal Server Error)',
        () async {
      // Arrange
      final client = MockClient();
      const query = 'AAPL';
      final url = "$baseUrl/search/?q=$query&token=$token";
      final mockResponse = http.Response('Internal Server Error', 500);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 500);
      expect(response.body, 'Internal Server Error');
    });

    test('should return error message on invalid URL (404 Not Found)',
        () async {
      // Arrange
      final client = MockClient();
      const query = 'AAPL';
      final url = "$baseUrl/search/?q=$query&token=$token";
      final mockResponse = http.Response('Not Found', 404);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 404);
      expect(response.body, 'Not Found');
    });
  });

  group('Stock Profile API', () {
    test('should return stock profile data on successful API call', () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/stock/profile2?symbol=$selectedSymbol&token=$token";
      final mockResponseData = {
        'name': 'Apple Inc.',
        'symbol': 'AAPL',
        'type': 'Common Stock',
        // Add more mock fields if necessary
      };

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => http.Response(json.encode(mockResponseData), 200),
      );

      // Act
      final response = await client.get(Uri.parse(url));
      final data = json.decode(response.body);

      // Assert
      expect(response.statusCode, 200);
      expect(data['name'], 'Apple Inc.');
      expect(data['symbol'], 'AAPL');
    });

    test(
        'should return error message on API failure (500 Internal Server Error)',
        () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/stock/profile2?symbol=$selectedSymbol&token=$token";
      final mockResponse = http.Response('Internal Server Error', 500);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 500);
      expect(response.body, 'Internal Server Error');
    });

    test('should return error message on invalid URL (404 Not Found)',
        () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/stock/profile2?symbol=$selectedSymbol&token=$token";
      final mockResponse = http.Response('Not Found', 404);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 404);
      expect(response.body, 'Not Found');
    });
  });
  group('Stock Quote API', () {
    test('should return stock quote data on successful API call', () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/quote?symbol=$selectedSymbol&token=$token";
      final mockResponseData = {
        'currentPrice': 150.00,
        'high': 155.00,
        'low': 145.00,
        // Add more mock fields if necessary
      };

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => http.Response(json.encode(mockResponseData), 200),
      );

      // Act
      final response = await client.get(Uri.parse(url));
      final data = json.decode(response.body);

      // Assert
      expect(response.statusCode, 200);
      expect(data['currentPrice'], 150.00);
      expect(data['high'], 155.00);
      expect(data['low'], 145.00);
    });

    test(
        'should return error message on API failure (500 Internal Server Error)',
        () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/quote?symbol=$selectedSymbol&token=$token";
      final mockResponse = http.Response('Internal Server Error', 500);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 500);
      expect(response.body, 'Internal Server Error');
    });

    test('should return error message on invalid URL (404 Not Found)',
        () async {
      // Arrange
      final client = MockClient();
      const selectedSymbol = 'AAPL';
      final url = "$baseUrl/quote?symbol=$selectedSymbol&token=$token";
      final mockResponse = http.Response('Not Found', 404);

      when(client.get(Uri.parse(url))).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      final response = await client.get(Uri.parse(url));

      // Assert
      expect(response.statusCode, 404);
      expect(response.body, 'Not Found');
    });
  });
  group('Stock WebSocket API', () {
    test('should return chart data on successful WebSocket connection',
        () async {
      // Arrange
      final mockWebSocketChannel = MockWebSocketChannel();
      final url = 'wss://ws.finnhub.io?token=$token';
      final chartData = {'data': 'some data'};

      when(mockWebSocketChannel.stream)
          .thenAnswer((_) => Stream.fromIterable([jsonEncode(chartData)]));

      // Act
      final stream = mockWebSocketChannel.stream;
      final data =
          await stream.first; // Assuming we get data from the first event

      // Assert
      expect(data, jsonEncode(chartData));
    });

    test('should return error message on WebSocket failure', () async {
      // Arrange
      final mockWebSocketChannel = MockWebSocketChannel();
      final url = 'wss://ws.finnhub.io?token=$token';
      final error = Exception('WebSocket error');

      // Simulate WebSocket connection failure
      when(mockWebSocketChannel.stream).thenThrow(error);

      // Act
      // Use a try-catch block to capture the error
      try {
        await mockWebSocketChannel.stream.first;
        fail('Expected an error to be thrown');
      } catch (e) {
        // Assert
        expect(e, error);
      }
    });
  });
}
