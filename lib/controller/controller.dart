// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:delivery_app/dilever_data.dart';
import 'package:delivery_app/dummy_meal.dart';
import 'package:delivery_app/model/category.dart';
import 'package:delivery_app/model/deliver.dart';
import 'package:delivery_app/model/meal.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  List<Category> category_meal = List.of(CATEGORIES);
  List<Deliver> delivery = List.of(Delivery);
  RxList order_type = [].obs;
  List<Meal> meal = List.of(MEALS);
  RxList order = [].obs;
  var totalprie = 0.0.obs;

  gettype(int index) {
    for (var item in meal) {
      if (index == 0) {
        order_type.addIf(item.categories == 'c1', item);
      } else if (index == 1) {
        order_type.addIf(item.categories == 'c2', item);
      } else if (index == 2) {
        order_type.addIf(item.categories == 'c3', item);
      } else if (index == 3) {
        order_type.addIf(item.categories == 'c4', item);
      }
    }
  }

  addorder(
      String id, int numberoforder, String image, String title, double price) {
    order.add({
      'id': id,
      'numberoforder': numberoforder,
      'image': image,
      'title': title,
      'price': price,
    });
    print(order);
  }

  removeorder(int index) {
    order.removeAt(index);
  }
}
