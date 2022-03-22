// ignore_for_file: constant_identifier_names


import 'package:delivery_app/model/category.dart';
import 'package:delivery_app/model/meal.dart';

const CATEGORIES = [
  Category(id: 'c1', title: 'Main', image: 'images/dish.png'),
  Category(
    id: 'c2',
    title: 'Soups',
    image: 'images/soup.png',
  ),
  Category(
    id: 'c3',
    title: 'Salade',
    image: 'images/salad.png',
  ),
  Category(
    id: 'c4',
    title: 'Drinks',
    image: 'images/soda.png',
  ),
];

const MEALS = [
  //meal 
  Meal(
      id: 'm1',
      categories: 'c1',
      title: 'Quarter Pounder with Cheese',
      imageUrl:
          'images/c1/1.png',
      calories: 520,
      rate: 4.5,
      time: 30,
      price: 18,
      detail:
          'Each Quarter Pounder® with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot, deliciously juicy and cooked when you order. It’s seasoned with just a pinch of salt and pepper, sizzled on a flat iron grill, then topped with slivered onions, tangy pickles and two slices of melty American cheese on a sesame seed bun Each Quarter Pounder® with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot,Each Quarter Pounder® with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot,Each Quarter Pounder® with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot,Pounder® with Cheese burger features a ¼ lb.* of 100% fresh beef that’s hot,'),
  
  Meal(
      id: 'm2',
      categories: 'c1',
      title: '6 Piece Chicken McNuggets Happy Meal',
      imageUrl:
          'images/c1/2.png',
      calories: 475,
      rate: 4.5,
      time: 30,
      price: 100,
      detail:
          '6 Piece Chicken McNuggets (6 piece), World Famous Fries (Kids), 1% Low Fat Milk Jug, Apple Slices'),
  Meal(
      id: 'm3',
      categories: 'c1',
      title: 'Deluxe Crispy Chicken Sandwich',
      imageUrl:
          'images/c1/3.png',
      calories: 530,
      rate: 4.5,
      time: 30,
      price: 20,
      detail:
          'Get a little extra with toppings. Go deluxe with shredded lettuce, Roma tomatoes and mayo to take crispy, juicy and tender to the next level. The Deluxe Crispy Chicken sandwich has 530 calories.'),
  Meal(
      id: 'm4',
      categories: 'c1',
      title: 'Spicy Crispy Chicken Sandwich',
      imageUrl:
          'images/c1/4.png',
      calories: 530,
      rate: 4.5,
      time: 30,
      price: 20,
      detail:
          'With our Spicy Pepper Sauce topping the southern style fried chicken fillet on a toasted potato roll, this sandwich was made for those who like it crispy, juicy, tender and hot. The Spicy Crispy Chicken sandwich has 530 calories'),
  //drinks
  Meal(
      id: 'm5',
      categories: 'c4',
      title: 'Coca-Cola',
      imageUrl:
          'images/c4/1.png',
      calories: 100,
      rate: 4.5,
      time: 5,
      price: 5,
      detail:
          'Coca-Cola is a refreshing McDonald\'s soda option that complements all of your menu favorites. Have you ever wondered'),
  Meal(
      id: 'm6',
      categories: 'c4',
      title: 'Hi-C Orange Lavaburst',
      imageUrl:
          'images/c4/2.png',
      calories: 100,
      rate: 4.5,
      time: 5,
      price: 5,
      detail:
          'You asked for it, you got it—Hi-C Orange at McDonald’s is back! With a fruity flavor that teases your tastebuds it’s the perfect addition to any McDonald’s meal'),
  Meal(
      id: 'm7',
      categories: 'c4',
      title: 'Minute Maid Premium Orange Juice',
      imageUrl:
          'images/c4/3.png',
      calories: 100,
      rate: 4.5,
      time: 5,
      price: 5,
      detail:
          '100% orange juice, packed with Vitamin C. Available in Small, Medium and Large.'),
//salade
  Meal(
      id: 'm8',
      categories: 'c3',
      title: 'Greek Salad',
      imageUrl:
          'images/c3/1.png',
      calories: 80,
      rate: 4.5,
      time: 10,
      price: 12,
      detail:
          'Make this salad for your next picnic, and it’ll be a guaranteed hit. A tahini miso dressing gives it a creamy umami coating, while peaches add juicy pops of sweetness. I finish it with toasted pepitas for crunch.'),

  Meal(
      id: 'm9',
      categories: 'c3',
      title: 'Tomato Salad',
      imageUrl:
          'images/c3/2.png',
      calories: 80,
      rate: 4.5,
      time: 10,
      price: 12,
      detail:
          'You won’t miss the bacon in this lightened-up take on classic broccoli salad. Smoky roasted nuts take its place, adding delectable savory bites. A lightly creamy, sweet & tangy dressing takes the whole thing over the top.'),
  Meal(
      id: 'm10',
      categories: 'c3',
      title: 'chicken salad',
      imageUrl:
          'images/c3/3.png',
      calories: 80,
      rate: 4.5,
      time: 10,
      price: 12,
      detail:
          'As soon as the temperature starts to dip in the fall, I look forward to making this salad. Made with just 7 ingredients, it’s a breeze to put together, but a bright lemon dressing, Parmesan cheese, pine nuts, and dried cranberries make it zippy, fresh, and satisfyin'),

//soupe
  Meal(
      id: 'm11',
      categories: 'c2',
      title: 'chicken soup bowl',
      imageUrl:
          'images/c2/1.png',
      calories: 345,
      rate: 4.5,
      time: 45,
      price: 25,
      detail:
          'With a few simple swaps, you can make this soup vegetarian-friendly. Ditch the chicken, use veggie broth and toss in 2 more cups of baby spinach'),

  Meal(
      id: 'm12',
      categories: 'c2',
      title: 'Dish Detail Red',
      imageUrl:
          'images/c2/2.png',
      calories: 250,
      rate: 4.5,
      time: 30,
      price: 30,
      detail:
          'With the help of your Dutch Oven, this vegetarian soup can be made in just 30 minutes.'),
  Meal(
      id: 'm13',
      categories: 'c2',
      title: 'Lentile Soup',
      imageUrl:
          'images/c2/3.png',
      calories: 560,
      rate: 4.5,
      time: 30,
      price: 18,
      detail: 'Cozy up with this sweet squash soup'),
];
