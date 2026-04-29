import 'package:food_cafe_user/project/features/home_page/widgets/feel_container.dart';
import 'package:food_cafe_user/project/helpers/custome_code/global.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  final feelList = [].obs;

  Future<void> getFeelData() async {
    Future.delayed(const Duration(seconds: 3), () {
      List<FeelContainer> items = [
        FeelContainer(
          onTap: () {},
          image: '$imagePath/c1.png',
          t1: 'Explore Every',
          t2: 'Mood',
        ),
        FeelContainer(
          onTap: () {},
          image: '$imagePath/c2.png',
          t1: 'Choose A',
          t2: 'Offer',
        ),
        FeelContainer(
          onTap: () {},
          image: '$imagePath/c3.png',
          t1: 'Pick Something',
          t2: 'Light',
        ),
        FeelContainer(
          onTap: () {},
          image: '$imagePath/c4.png',
          t1: 'Overcome The',
          t2: 'Boredom',
        ),
        FeelContainer(
          onTap: () {},
          image: '$imagePath/c5.png',
          t1: 'Ahead Awaits',
          t2: 'Excitement',
        ),
      ];

      feelList.addAll(items);
    });
  }
}
