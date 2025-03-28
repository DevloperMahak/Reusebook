class Book {
  final String bookName;
  String? bookDescription;
  String? publication;
  final author;
  String? printPrice;
  String? sellingPrice;
  final double price;
  final String condition;

  Book({
    required this.bookName,
    required this.bookDescription,
    required this.publication,
    required this.author,
    required this.printPrice,
    required this.sellingPrice,
    required this.price,
    required this.condition,

  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json['BookName'] ?? 'Unknown',
      bookDescription: json['BookDescription'] ?? 'No description available',
      publication: json['Publication'] ?? 'Unknown',
      author: json['Author'] ?? 'Unknown',
      printPrice: json['PrintPrice'] ?? '0.00',
      sellingPrice: json['SellingPrice'] ?? '0.00',
      price: double.tryParse(json['Price']?.toString() ?? '0.0') ?? 0.0,
      condition: json['Condition'] ?? 'Good',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'BookName': bookName,
      'BookDescription': bookDescription,
      'Publication': publication,
      'Author': author,
      'PrintPrice': printPrice,
      'SellingPrice': sellingPrice,
      'Price': price,
      'Condition': condition,
    };
  }
}
