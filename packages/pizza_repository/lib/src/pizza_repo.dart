import 'dart:html' as html;
import 'dart:typed_data';

import '../pizza_repository.dart';

abstract class PizzaRepo {

  Future<List<Pizza>> getPizzas();

  Future<String> sendImage(Uint8List file, String name);
}