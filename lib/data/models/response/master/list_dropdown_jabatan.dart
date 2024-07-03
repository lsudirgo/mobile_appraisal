import 'package:animated_custom_dropdown/custom_dropdown.dart';

class ListjabatanDropdown with CustomDropdownListFilter {
  final String id;
  final String name;
  const ListjabatanDropdown(this.id, this.name);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
