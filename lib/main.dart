import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/albumbiblio.dart';
import 'views/album_list.dart';

void main() {
  AlbumBiblio.leerArchivo().then((albumes) {
    runApp(
      ChangeNotifierProvider(
          create: (_) {
            AlbumBiblio albumBiblio = (albumes == null)
                ? AlbumBiblio()
                : AlbumBiblio.fromJson(albumes);
            return albumBiblio;
          },
          child: const MyApp()),
    );
  });
}
// void main() {
//   runApp(
//     ChangeNotifierProvider(create: (_) => AlbumBiblio(), child: const MyApp()),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AlbumLista(),
    );
  }
}
