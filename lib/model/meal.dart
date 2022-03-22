class Meal {
  final String id;
  final String categories;
  final String title;
  final String imageUrl;
  final double time;
  final int calories;
  final double rate;
  final double price;
  final String detail;

  const Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.time,
      required this.calories,
      required this.rate,
      required this.price,
      required this.detail});
}
