class CartModel {
  int id=0;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel(
      { this.id=0,
        this.name,
        this.price,
        this.img,
         this.quantity,
        this.time,
        this.isExist
       });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity=json['quantity'];
    isExist=json['isExist'];
    time=json['time'];

  }


}