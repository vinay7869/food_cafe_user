import 'package:flutter/material.dart';

late Size mq;

const pColor = Color(0xFFC0262A);

const sColor = Color(0xFFDE496E);

const txtColor = Color(0xffFFFFFF);

const scaffoldBgClr = Color(0xffFFFFFF);

const blackColor = Color(0xff000000);

const String imagePath = 'assets/images';

const String lottiePath = 'assets/lotties';

const profilePath = 'assets/p_images';

const String fontPath = 'assets/fonts';

const String appName = 'Food Cafe';

const String packageName = '';

const String clientId =
    '377799740812-irm2mjkafs2avbikj1fev7rk0cu8eqol.apps.googleusercontent.com';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}
