import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/features/categories/controllers/cart_controller.dart';
import 'package:food_cafe_user/project/features/categories/controllers/categories_controller.dart';
import 'package:food_cafe_user/project/features/categories/controllers/price_controller.dart';
import 'package:food_cafe_user/project/features/categories/widgets/addons_selector.dart';
import 'package:food_cafe_user/project/features/categories/widgets/bottom_nav_pricing.dart';
import 'package:food_cafe_user/project/features/categories/widgets/size_selector.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:food_cafe_user/project/helpers/widgets/custom_loading.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DishInfoScreen extends StatefulWidget {
  final DishModel dishModel;
  const DishInfoScreen({super.key, required this.dishModel});

  @override
  State<DishInfoScreen> createState() => _DishInfoState();
}

class _DishInfoState extends State<DishInfoScreen> {
  final _priceController = Get.find<PriceController>();
  final _categoriesController = Get.find<CategoriesController>();
  final _cartController = Get.find<CartController>();

  final showH = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.dishModel.extras != null) {
        final variants = widget.dishModel.extras?.variants;

        if (variants!.isNotEmpty) {
          _priceController.selectedVariant.value = 0;

          _priceController.calculatePrice(
            variants: variants,
            addons: widget.dishModel.extras!.addons,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: txtColor,
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),

        // share function
        actions: [
          InkWell(
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 500));

              try {
                final file = await _categoriesController.downloadFile(
                  widget.dishModel.image,
                  '${widget.dishModel.name}.jpg',
                );

                final params = ShareParams(
                  text:
                      'Hey checkout this awesome Dish: ${widget.dishModel.name}\nhttps://play.google.com/store/apps/details?id=$packageName',
                  files: [XFile('${file.path}/image.jpg')],
                );

                await SharePlus.instance.share(params);
              } catch (e) {
                log('Error sharing file: $e');
              } finally {
                if (context.mounted) {
                  context.pop();
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset('$imagePath/share.png', scale: 3.5),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,

      //body
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // food image
                  SizedBox(
                    height: mq.height * .47,
                    width: double.maxFinite,
                    child: CachedNetworkImage(
                      imageUrl: widget.dishModel.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Center(child: CircularProgressIndicator()),
                      placeholder: (context, url) => const CustomLoading(),
                    ),
                  ),

                  // star container
                  Container(
                    padding: EdgeInsets.only(
                      left: mq.width * .04,
                      right: mq.width * .04,
                      bottom: mq.height * .01,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: mq.height * .07),
                            Image.asset(
                              widget.dishModel.isVeg
                                  ? '$imagePath/Veg.png'
                                  : '$imagePath/Nonveg.png',
                              scale: 3,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.dishModel.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),

                        // rating
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              widget.dishModel.rating.toInt(),
                              (index) =>
                                  Image.asset('$imagePath/star.png', scale: 3),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.dishModel.rating.toString(),
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),

                        // description
                        Padding(
                          padding: EdgeInsets.only(
                            top: mq.height * .03,
                            bottom: mq.height * .02,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.dishModel.name,
                              style: const TextStyle(color: Color(0xff818181)),
                            ),
                          ),
                        ),

                        // Sizes
                        if (widget.dishModel.extras != null)
                          SizeSelector(
                            widget: widget,
                            priceController: _priceController,
                          ),

                        //  Addons
                        if (widget.dishModel.extras != null)
                          AddonsSelector(
                            widget: widget,
                            priceController: _priceController,
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              // show animation
              if (showH.value)
                Padding(
                  padding: EdgeInsets.only(top: mq.height * .4),
                  child: SizedBox(
                    height: mq.height * .6,
                    child: const Hurray(),
                  ),
                ),
            ],
          ),
        ),
      ),

      // Bottom Pricing
      bottomNavigationBar: BottomNavPricing(
        priceController: _priceController,
        showH: showH,
        cartController: _cartController,
        widget: widget,
      ),
    );
  }
}
