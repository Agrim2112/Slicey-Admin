import 'package:pizza_repository/pizza_repository.dart';

import '../models/macros.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  String name;
  bool isVeg;
  int spicy;
  String description;
  int price;
  int discount;
  Macros macros;

  PizzaEntity({
      required this.pizzaId,
      required this.picture,
      required this.name,
      required this.isVeg,
      required this.spicy,
      required this.description,
      required this.price,
      required this.discount,
      required this.macros});

  Map<String,Object> toDocument(){
    return{
      'pizzaId': pizzaId,
      'picture': picture,
      'name':name,
      'isVeg': isVeg,
      'spicy': spicy,
      'pizzaId': pizzaId,
      'description':description,
      'price':price,
      'discount':discount,
      'macros':macros.toEntity().toDocument()
    };
  }

  static PizzaEntity fromDocument(Map<String,dynamic> doc) {
    return PizzaEntity(
        pizzaId:doc['pizzaId'],
        picture: doc['picture'],
        name: doc['name'],
        isVeg: doc['isVeg'],
        spicy: doc['spicy'],
        description: doc['description'],
        price:doc['price'],
        discount:doc['discount'],
        macros:Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])));
  }
}