import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(HomePage());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Fetcher',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final int numberOfImages = 50;
  final String imageUrl = 'https://picsum.photos/id'; // Base URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Fetcher'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemCount: numberOfImages,
        itemBuilder: (context, index) {
          final imageId = index + 1;
          final imageUri = Uri.parse('$imageUrl/$imageId/200/300');
          return CachedNetworkImage(
            imageUrl: imageUri.toString(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ),
    );
  }
}
