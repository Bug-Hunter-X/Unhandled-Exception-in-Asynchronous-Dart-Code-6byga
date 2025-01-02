```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Success! Do something with 'response'
      // For example, parse JSON:
      // final data = jsonDecode(response.body);
    } else {
      // Handle specific HTTP error codes
      // For example, throw a custom exception:
      throw HttpException('Failed to load data: ${response.statusCode}', uri: Uri.parse('https://example.com/data'));
    }
  } on SocketException catch (e) {
    // Handle socket exceptions specifically
    print('Network error: $e');
    // Consider showing a user-friendly message or retry mechanism
  } on FormatException catch (e) {
    // Handle JSON parsing errors
    print('JSON parsing error: $e');
    // Consider retry or fallback mechanisms
  } on HttpException catch (e) {
      print('HTTP error: ${e.message} at ${e.uri}');
  } catch (e) {
    // Handle other unexpected exceptions
    print('An unexpected error occurred: $e');
    // Consider reporting the error to a backend or logging service
  }
}
```