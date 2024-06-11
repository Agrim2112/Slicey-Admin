import '../entities/entities.dart';
import 'macros.dart';

class Pizza {
  String pizzaId;
  String picture;
  String name;
  bool isVeg;
  int spicy;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.name,
    required this.isVeg,
    required this.spicy,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros
  });

  PizzaEntity toEntity() {
    return PizzaEntity(
        pizzaId:pizzaId,
        picture: picture,
        name: name,
        isVeg: isVeg,
        spicy: spicy,
        description: description,
        price:price,
        discount:discount,
        macros:macros
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        pizzaId:entity.pizzaId,
        picture: entity.picture,
        name: entity.name,
        isVeg: entity.isVeg,
        spicy: entity.spicy,
        description: entity.description,
        price:entity.price,
        discount:entity.discount,
        macros:entity.macros
    );
  }

}