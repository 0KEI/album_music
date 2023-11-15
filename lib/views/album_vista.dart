import 'package:album_music/model/album.dart';
import 'package:flutter/material.dart';

class AlbumVista extends StatelessWidget {
  final Album album;
  const AlbumVista({super.key, required this.album});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Datos del Album"),
        ),
        body: Center(
          child: SizedBox(
            width: 400,
            height: 400,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: Placeholder(),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Título: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          album.titulo,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Cantante: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          album.artista,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Año de lanzamiento: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          album.anio.toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Género: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        Text(
                          generos[album.gender],
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12.0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
