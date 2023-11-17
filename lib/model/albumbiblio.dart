import 'package:flutter/material.dart';
import 'album.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class AlbumBiblio extends ChangeNotifier {
  final List _listaAlbumes = [];
  static String nombreArchivo = "albumes.json";

  AlbumBiblio();

  AlbumBiblio.fromJson(Map json) {
    List albumes = json["albumes"];
    for (int i = 0; i < albumes.length; i++) {
      _listaAlbumes.add(Album.fromJson(albumes[i]));
    }
  }

  Map toJson() {
    List albumes = [];
    for (int i = 0; i < _listaAlbumes.length; i++) {
      albumes.add(_listaAlbumes[i].toJson());
    }
    Map mapa = {"albumes": albumes};
    return mapa;
  }

  List get albumes => _listaAlbumes;

  Album getAlbumByIndex(int index) => _listaAlbumes[index];

  void addAlbum(Album album) {
    _listaAlbumes.add(album);
    notifyListeners();
    guardarAlbumes();
  }

  bool updateAlbum(int index, Album album) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes[index] = album;
      notifyListeners();
      guardarAlbumes();
      return true;
    }
    return false;
  }

  bool removeAlbum(int index) {
    if (index >= 0 && index < _listaAlbumes.length) {
      _listaAlbumes.removeAt(index);
      notifyListeners();
      guardarAlbumes();
      return true;
    }
    return false;
  }

  static Future get _pathLocal async {
    final directorio = await getApplicationDocumentsDirectory();
    return directorio.path;
  }

  static Future get _archivoLocal async {
    final path = await _pathLocal;
    return File('$path${Platform.pathSeparator}$nombreArchivo');
  }

  Future guardarAlbumes() async {
    final archivo = await _archivoLocal;
    return archivo.writeAsString(jsonEncode(toJson()));
  }

  static Future leerArchivo() async {
    final archivo = await _archivoLocal;
    if (archivo.existsSync()) {
      String contenido = await archivo.readAsString();
      return jsonDecode(contenido);
    }

    return null;
  }
}
