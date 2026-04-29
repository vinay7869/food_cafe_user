import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';

class OfferSlider extends StatelessWidget {
  final String img, price, dishName, offerPercent, rating;
  final VoidCallback onTap;
  const OfferSlider({
    super.key,
    required this.img,
    required this.price,
    required this.dishName,
    required this.offerPercent,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 148,
          width: mq.width * .9,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(17)),
                  child: Image.asset(img, fit: BoxFit.cover),
                ),
              ),
              Stack(
                children: [
                  Image.asset('$imagePath/off.png', scale: 3.7),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mq.width * .043,
                      top: mq.height * .014,
                    ),
                    child: Transform.rotate(
                      angle: 145 * 3.14 / 80,
                      child: Text(
                        '$offerPercent%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 31,
                  width: 77,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(17),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.grey.withOpacity(.60),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('$imagePath/star.png', scale: 3),
                      SizedBox(width: mq.width * .02),
                      const Text(
                        '4.8',
                        style: TextStyle(
                          color: txtColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Extra Cheese Pizza'),
            SizedBox(width: mq.width * .37),
            Padding(
              padding: EdgeInsets.only(right: mq.width * .06),
              child: Text(
                '₹ $price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: pColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
