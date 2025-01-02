```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Success! Do something with 'response'
    } else {
      // Error: Handle the error appropriately
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions during the network request
    print('Error: $e');
    // Rethrow the exception to be handled further up the call stack if needed
    rethrow; 
  }
}
```