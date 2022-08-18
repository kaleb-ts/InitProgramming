import 'dart:async';
import 'dart:io';

const String address = "localhost";
const int port = 1111;
HttpServer? server;

Future<void> main() async {
   Stream<List<int>> content =
        File('streamServer/Assets/index.json"').openRead();
    // List<String> lines = await content
    //     .transform(utf8.decoder)
    //     .transform(const LineSplitter())
    //     .toList();

    content.listen((obj) {
      print(obj.toString());
    });
  // bindServer();
  // startListening();
}

bindServer() async {
  server = await HttpServer.bind(address, port);
}

startListening() async {
  server?.listen((HttpRequest request) async {
    Stream<List<int>> content =
        File('streamServer/Assets/index.json"').openRead();
    // List<String> lines = await content
    //     .transform(utf8.decoder)
    //     .transform(const LineSplitter())
    //     .toList();

    content.listen((obj) {
      print(obj);
    });

    // request.response
  });
}
