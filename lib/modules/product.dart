

class Product {
  final int id;
  final String title;
   var price; 
  final String category;
  final String image;
  final String description;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.image,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    
  
    return Product(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        category: jsonData['category'],
        description: jsonData['description'],
        image: jsonData['image']);
  }
}
