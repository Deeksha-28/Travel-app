class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel ABC',
    address: 'New York',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Hawaii',
    address: 'Hawaii',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel Tulum',
    address: 'Mexico',
    price: 240,
  ),
];
