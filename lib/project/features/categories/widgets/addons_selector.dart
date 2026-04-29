import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/price_controller.dart';
import 'package:food_cafe_user/project/features/categories/screens/dish_info.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/get.dart';

class AddonsSelector extends StatelessWidget {
  const AddonsSelector({
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
        visible: widget.dishModel.extras!.addons.isNotEmpty,
        child: Container(
          margin: EdgeInsets.only(top: 7.h),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: .10),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: mq.width * .06,
              right: mq.width * .06,
              bottom: mq.height * .001,
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
                      'Addons',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                ...widget.dishModel.extras!.addons.mapIndexed((i, e) {
                  final isSelected = _priceController.addonsSelected.contains(
                    i,
                  );
                  return Row(
                    children: [
                      Text(
                        e.name,
                        style: const TextStyle(color: Color(0xff818181)),
                      ),
                      const Spacer(),
                      Text('₹${e.price}'),
                      Checkbox.adaptive(
                        value: isSelected,
                        activeColor: pColor,
                        checkColor: Colors.white,

                        onChanged: (value) {
                          if (value!) {
                            _priceController.addonsSelected.add(i);
                          } else {
                            _priceController.addonsSelected.remove(i);
                          }

                          _priceController.calculatePrice(
                            variants: widget.dishModel.extras!.variants,
                            addons: widget.dishModel.extras!.addons,
                          );
                        },
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
