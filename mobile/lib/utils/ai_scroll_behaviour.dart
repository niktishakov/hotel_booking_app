import 'dart:io';

import 'package:flutter/material.dart';

class AiScrollBehaviour extends ScrollBehavior {
  const AiScrollBehaviour();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return Platform.isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
  }
}
