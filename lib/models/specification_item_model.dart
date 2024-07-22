class SpecificationItem {
  final String id;
  final List<String> name;
  final double price;
  final int sequenceNumber;
  final bool isDefaultSelected;
  final String specificationGroupId;
  final int uniqueId;
  bool isSelected;
  int quantity;


  SpecificationItem({
    required this.id,
    required this.name,
    required this.price,
    required this.sequenceNumber,
    required this.isDefaultSelected,
    required this.specificationGroupId,
    required this.uniqueId,
    this.isSelected = false,
    this.quantity = 1,
  });

  factory SpecificationItem.fromJson(Map<String, dynamic> json) {
    return SpecificationItem(
      id: json['_id'],
      name: List<String>.from(json['name']),
      price: json['price'].toDouble(),
      sequenceNumber: json['sequence_number'],
      isDefaultSelected: json['is_default_selected'] ?? false,
      specificationGroupId: json['specification_group_id'],
      uniqueId: json['unique_id'],
      isSelected: json['is_default_selected'] ?? false,
      quantity: 1,
    );
  }
}