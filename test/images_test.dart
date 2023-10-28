import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:intership_project/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.iconsEdit).existsSync(), isTrue);
  });
}
