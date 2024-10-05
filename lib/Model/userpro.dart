

class UserProduct{
  String Productname;
  String price;
String? imageUrl;
String?id;
UserProduct({
  required this.Productname,
  required this.price,
  this.imageUrl,
  this.id
});
Map<String,dynamic>toMap(ids)=>{
"name":Productname,
"price":price,
"image":imageUrl,
"id":ids
};
factory UserProduct.fromMap(Map<String,dynamic>data){
return UserProduct(Productname: data["name"],
 price: data['price'],
 imageUrl: data['image'],
 id: data['id']
 );
}
}