import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/price_controller.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_info.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/state_manager.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.widget,
    required PriceController priceController,
  }) : _priceController = priceController;

  final DishInfoScreen widget;
  final PriceController _priceController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: widget.dishModel.extras!.variants.isNotEmpty,
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: .10),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: mq.width * .06,
              right: mq.width * .06,
              bottom: mq.height * .01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: mq.height * .02,
                      bottom: mq.height * .001,
                    ),
                    child: Text(
                      'Sizes',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                ...widget.dishModel.extras!.variants.mapIndexed((i, e) {
                  return Row(
                    children: [
                      Text(
                        e.name,
                        style: const TextStyle(color: Color(0xff818181)),
                      ),
                      const Spacer(),
                      Expanded(
                        child: RadioGroup<int>(
                          groupValue: _priceController.selectedVariant.value,
                          onChanged: (value) {
                            _priceController.selectedVariant.value = value!;

                            _priceController.calculatePrice(
                              variants: widget.dishModel.extras!.variants,
                              addons: widget.dishModel.extras!.addons,
                            );
                          },
                          child: RadioListTile(
                            visualDensity: VisualDensity.compact,
                            contentPadding: EdgeInsets.zero,
                            value: i,
                            title: Align(
                              alignment: const Alignment(1, 0),
                              child: Text(
                                '₹${e.price}',
                                style: TextStyle(
                                  color:
                                      _priceController.selectedVariant.value ==
                                          i
                                      ? pColor
                                      : const Color(0xff818181),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            dense: true,
                            activeColor: pColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
