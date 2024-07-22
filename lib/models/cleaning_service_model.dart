import 'specification_model.dart';

class CleaningService {
  final String id;
  final List<String> name;
  double price;
  final List<int> itemTaxes;
  final List<Specification> specifications;

  CleaningService({
    required this.id,
    required this.name,
    required this.price,
    required this.itemTaxes,
    required this.specifications,
    
  });

  factory CleaningService.fromJson(Map<String, dynamic> json) {
    return CleaningService(
      id: json['_id'],
      name: List<String>.from(json['name']),
      price: json['price'].toDouble(),
      itemTaxes: List<int>.from(json['item_taxes']),
      specifications: (json['specifications'] as List)
          .map((spec) => Specification.fromJson(spec))
          .toList(),
    );
  }
}



