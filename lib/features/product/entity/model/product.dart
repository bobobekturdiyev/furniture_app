class Product {
  final int id;
  final String image;
  final String name;
  final int itemNumber;
  final String category;
  final int price;
  final bool isLiked;

  const Product({
    required this.id,
    required this.image,
    required this.name,
    required this.itemNumber,
    required this.category,
    required this.price,
    this.isLiked = false,
  });

  Product copyWith({required bool? isLiked}) => Product(
        id: id,
        image: image,
        name: name,
        itemNumber: itemNumber,
        category: category,
        price: price,
        isLiked: isLiked ?? this.isLiked,
      );

  static List<Product> generate() {
    List<Product> list = [];

    list.addAll([
      const Product(
        id: 1,
        image:
            "https://i.pinimg.com/originals/41/af/35/41af35e07420f1c651b1465395915c6a.png",
        name: "Chair",
        itemNumber: 1,
        category: "Goal Design",
        price: 200,
      ),
      const Product(
        id: 2,
        image:
            "https://t3.ftcdn.net/jpg/07/40/06/02/360_F_740060239_eGZu2uqTX0bIVdmOEZykt54i8AMg5bzg.jpg",
        name: "Sofa",
        itemNumber: 2,
        category: "Goal Design",
        price: 700,
      ),
      const Product(
        id: 3,
        image:
            "https://static.vecteezy.com/system/resources/previews/023/522/872/non_2x/modern-sofa-cutout-free-png.png",
        name: "Sofa Yellow",
        itemNumber: 3,
        category: "Goal Design",
        price: 750,
      ),
      const Product(
        id: 4,
        image:
            "https://t4.ftcdn.net/jpg/07/22/23/17/360_F_722231708_EObpkEu2wO115Srj18Y9ihaLsytFvwn7.jpg",
        name: "Sofa Gray",
        itemNumber: 4,
        category: "Goal Design",
        price: 1000,
      ),
    ]);

    return list;
  }
}
