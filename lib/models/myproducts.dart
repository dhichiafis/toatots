class Product{
  final String image;
  final String title;
  final String description;
  final double price;

  Product({required this.image,required this.title,required this.description,required this.price});

  Product.fromJson(Map<String,Object?> json):
    image=json['image'] as String,
    title=json['title'] as String,
    description=json['description'] as String,
    price=json['price'] as double;


    Map<String,Object>toJson(){
      return ({
        'image':image,
        'title':title,
        'description':description,
        'price':price
      });
    }

}