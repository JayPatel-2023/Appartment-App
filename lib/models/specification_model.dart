import 'specification_item_model.dart';

class Specification {
  final String id;
  final List<String> name;
  final int sequenceNumber;
  final int uniqueId;
  final List<SpecificationItem> list;
  final int maxRange;
  final int range;
  final int type;
  final bool isRequired;
  final String? modifierId;
  final String? modifierGroupId;
  final String? modifierGroupName;
  final String? modifierName;
  final bool? isAssociated;
  final bool? isParentAssociate;
  final bool? userCanAddSpecificationQuantity;

  Specification({
    required this.id,
    required this.name,
    required this.sequenceNumber,
    required this.uniqueId,
    required this.list,
    required this.maxRange,
    required this.range,
    required this.type,
    required this.isRequired,
    this.modifierId,
    this.modifierGroupId,
    this.modifierGroupName,
    this.modifierName,
    this.isAssociated,
    this.isParentAssociate,
    this.userCanAddSpecificationQuantity,
  });

  factory Specification.fromJson(Map<String, dynamic> json) {
    return Specification(
      id: json['_id'],
      name: List<String>.from(json['name']),
      sequenceNumber: json['sequence_number'],
      uniqueId: json['unique_id'],
      list: (json['list'] as List)
          .map((item) => SpecificationItem.fromJson(item))
          .toList(),
      maxRange: json['max_range'],
      range: json['range'],
      type: json['type'],
      isRequired: json['is_required'],
      modifierId: json['modifierId'],
      modifierGroupId: json['modifierGroupId'],
      modifierGroupName: json['modifierGroupName'],
      modifierName: json['modifierName'],
      isAssociated: json['isAssociated'],
      isParentAssociate: json['isParentAssociate'],
      userCanAddSpecificationQuantity:
          json['user_can_add_specification_quantity'],
    );
  }
}
