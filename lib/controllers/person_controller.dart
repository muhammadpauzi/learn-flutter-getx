import 'dart:math';

import 'package:flutter_getx/models/person_model.dart';
import 'package:get/state_manager.dart';

class PersonController extends GetxController {
  Rx<Person> person = Person(id: 1, name: "Pauzi", age: 18).obs;

  void regenerateId() => person.update((val) {
        person.value.id = Random().nextInt(100);
      });
}
