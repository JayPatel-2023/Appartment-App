// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_super_parameters

import 'package:appartment_app/utils/constants/labels.dart';
import 'package:appartment_app/utils/constants/styles.dart';
import 'package:appartment_app/utils/extensions/list_extension.dart';
import 'package:appartment_app/views/apartment_view/widgets/increment_decrement_widget.dart';
import 'package:appartment_app/views/apartment_view/widgets/titletext_widget.dart';

import '../../models/specification_item_model.dart';
import '../../models/specification_model.dart';
import '../../utils/constants/colors.dart';
import 'widgets/bottom_price_widget.dart';
import 'widgets/sliver_persistent_header_widget.dart';
import 'widgets/sliver_to_box_adapter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/appartment_controller.dart';

class ApartmentView extends GetView<ApartmentController> {
  const ApartmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApartmentController>(
          id: ApartmentController.mainId,
          builder: (context) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                // Header with back button and icon
                SliverToBoxAdapterWidget(),

                // Header Title
                SliverPersistentHeaderWidget(),

                // Main List
                GetBuilder<ApartmentController>(builder: (controller) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Apartment Size
                              TitleText(
                                title: AppLabels.apartmentSize,
                                isRequired: controller.apartmentSizes.first.isRequired,
                              ),
                              Text("Choose ${controller.apartmentSizes.first.maxRange}", style: AppStyles.subTitleStyle),
                              _buildSpecificationSection(
                                  controller.apartmentSizes),

                              // Bedroom Cleaning
                              if (!controller.isSectionEmpty(
                                  controller.bedroomCleaning)) ...[
                                TitleText(
                                  title: AppLabels.bedroomCleaning,
                                ),
                                subTitleText(
                                    controller.bedroomCleaning.first.maxRange),
                                _buildSpecificationSection(
                                    controller.bedroomCleaning),
                              ],

                              // Living Room Cleaning
                              if (!controller.isSectionEmpty(
                                  controller.livingRoomCleaning)) ...[
                                TitleText(
                                  title: AppLabels.livingRoomCleaning,
                                ),
                                subTitleText(controller
                                    .livingRoomCleaning.first.maxRange),
                                _buildSpecificationSection(
                                    controller.livingRoomCleaning),
                              ],

                              // Bathroom Cleaning
                              if (!controller.isSectionEmpty(
                                  controller.bathroomCleaning)) ...[
                                TitleText(
                                  title: AppLabels.bathroomCleaning,
                                ),
                                subTitleText(
                                    controller.bathroomCleaning.first.maxRange),
                                _buildSpecificationSection(
                                    controller.bathroomCleaning),
                              ],

                              // Kitchen Cleaning
                              if (!controller.isSectionEmpty(
                                  controller.kitchenCleaning)) ...[
                                TitleText(
                                  title: AppLabels.kitchenCleaning,
                                ),
                                subTitleText(
                                    controller.kitchenCleaning.first.maxRange),
                                _buildSpecificationSection(
                                    controller.kitchenCleaning),
                              ],
                            ].divide(20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          }),
      bottomNavigationBar: BottomPriceWidget(),
    );
  }

  Widget subTitleText(int range) {
    return Text(
      "Choose up to $range",
      style: AppStyles.subTitleStyle,
    );
  }

  Widget _buildSpecificationSection(List<Specification> specifications) {
    return Column(
      children: specifications
          .expand(
            (spec) => spec.list.map(
              (item) => Row(
                children: [
                  // Radio Button for apartment size selection
                  if (spec.range == 1)
                    Radio<SpecificationItem>(
                      value: item,
                      groupValue: controller.selectedApartmentSize,
                      activeColor: AppColors.secondaryColor,
                      onChanged: (SpecificationItem? value) {
                        controller.selectApartmentSize(value);
                      },
                    ),

                  // Checkbox for apartment service selection
                  if (spec.range != 1)
                    Checkbox(
                        value: item.isSelected,
                        onChanged: (bool? value) {
                          controller.toggleItemSelection(item);
                        }),
                  Expanded(
                    child: Text(
                      item.name.first,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // Item quantity
                  if (item.isSelected && spec.range != 1)
                    IncrementDecrementWidgetx(
                      decrement: () => controller.decrementQuantity(item),
                      increment: () => controller.incrementQuantity(item),
                      counter: item.quantity.toString(),
                    ),
                  SizedBox(
                    width: 4.0,
                  ),

                  // Item price
                  if (item.price > 0)
                    Text(
                        '${AppLabels.rupeeSymbol} ${item.price.toStringAsFixed(2)}'),
                ].divide(4.0),
              ),
            ),
          )
          .toList(),
    );
  }
}
