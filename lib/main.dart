import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


void main(){
  runApp(FutureBuilder_StreamBuilder_35_demo());
}

//sample one future builder
/*class FutureBuilder_StreamBuilder_35_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FutureBuilder Example")),
        body: Center(child: StringFutureBuilder()),
      ),
    );
  }
}

class StringFutureBuilder extends StatelessWidget {
  Future<String> fetchString() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return "Hello from the future!";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchString(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return Text("Fetched: ${snapshot.data}");
        }
      },
    );
  }
}*/

//sample two future builder
/*class FutureBuilder_StreamBuilder_35_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FutureBuilder Example")),
        body: Center(child: ListFutureBuilder()),
      ),
    );
  }
}

class ListFutureBuilder extends StatelessWidget {
  Future<List<String>> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return ["Apple", "Banana", "Orange", "Grapes"];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final data = snapshot.data ?? [];
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(data[index]));
            },
          );
        }
      },
    );
  }
}*/
//sample three future builder
/*class FutureBuilder_StreamBuilder_35_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FutureBuilder Example")),
        body: Center(child: JsonFutureBuilder()),
      ),
    );
  }
}

class JsonFutureBuilder extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final data = snapshot.data ?? [];
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                  child:ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                  ));
            },
          );
        }
      },
    );
  }
}*/
// Define a model class for the data structure.
/*class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


class FutureBuilder_StreamBuilder_35_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Fetch Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define the future that fetches data.
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // Parse the JSON into a list of Post objects.
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            } else {
              return Text('No data found');
            }
          },
        ),
      ),
    );
  }
}*/
class FutureBuilder_StreamBuilder_35_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("FutureBuilder with New Image URL")),
        body: Center(child: CustomImageFutureBuilder()),
      ),
    );
  }
}

class CustomImageFutureBuilder extends StatelessWidget {
  // Function to fetch data from a different network source
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        // Show a loading indicator while waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        // Handle errors if the request fails
        else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        // Show the data once it's loaded
        else {
          final data = snapshot.data ?? [];

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // Using Picsum image URL for random images
              final imageUrl = 'https://picsum.photos/seed/${data[index]['id']}/300/200';

              return Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.network(
                      imageUrl, // Picsum image URL
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data[index]['title'], // Title from the JSON
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}



//----