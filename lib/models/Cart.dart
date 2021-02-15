class Cart {
  final String id,
  final String title,
  final String number,
  final String price,
  final String imgUrl,
      Cart({
  @required this.id,
  @required this.title,
  @required this.number,
  @required this.price,
  @required this.imgUrl,

  });
}
class CartDataProvider with ChangeNotifie {
  Map<String, Cart>  _cartItems = {};
  UnmodifiableMapView<String, Cart> get cartItems =>
    UnmodifiableMapView(_cartItems);
  int get cartItemsCount => _cartItems.length;
  double get totalAmount {
    var total = 0;
    _cartItems.forEach((key, item) {
      total += item.price * item.number;
    });
    return total;
  }
  void addItem({productId, price, title, imgUrl}){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId,(ex) => Cart(
        id:ex.id,
        price:ex.title,
        title:ex.title,
        imgUrl:ex.imgUrl,
        number:ex.number,
      ));

    }else{
     _cartItems.putIfAbsent(productId, () => Cart(
       id:"${DateTime.now()}",
       price:ex.title,
       title:ex.title,
       imgUrl:ex.imgUrl,
       number:1,
     ));
    }
    notifyListeners();
  }
  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();

  }
  void updateItemsSubOne({productId, price, title, imgUrl}){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId,(ex) => Cart(
        id:ex.id,
        price:ex.title,
        title:ex.title,
        imgUrl:ex.imgUrl,
        number:ex.number,
      ));

    }else{
      _cartItems.putIfAbsent(productId, () => Cart(
        id:"${DateTime.now()}",
        price:ex.title,
        title:ex.title,
        imgUrl:ex.imgUrl,
        number:1,
      ));
    }
    notifyListeners();
  }
  void updateItemsPlusOne({productId, price, title, imgUrl}){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId,(ex) => Cart(
        id:ex.id,
        price:ex.title,
        title:ex.title,
        imgUrl:ex.imgUrl,
        number:ex.number,
      ));

    }else{
      _cartItems.putIfAbsent(productId, () => Cart(
        id:"${DateTime.now()}",
        price:ex.title,
        title:ex.title,
        imgUrl:ex.imgUrl,
        number:1,
      ));
    }
    notifyListeners();
  }
  void  clear(){
    _cartItems = {};
    notifyListeners();
  }
}