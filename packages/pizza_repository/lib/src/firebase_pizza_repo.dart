import 'dart:developer';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;
import 'package:pizza_repository/pizza_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pizza_repository/src/pizza_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePizzaRepo implements PizzaRepo{

  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try{
      return await pizzaCollection
          .get()
          .then((value) => value.docs.map((e) =>
            Pizza.fromEntity(PizzaEntity.fromDocument(e.data()))
      ).toList());
    }
    catch(e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<String> sendImage(Uint8List file,String name) async{
    try{
      Reference firebaseStorageRef = FirebaseStorage
          .instance
          .ref()
          .child(name);

      await firebaseStorageRef.putData(file);
      return firebaseStorageRef.getDownloadURL();
    }
    catch(e){
      log(e.toString());
      rethrow;
    }
  }
}