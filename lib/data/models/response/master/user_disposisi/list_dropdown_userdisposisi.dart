import 'package:animated_custom_dropdown/custom_dropdown.dart';

class ListuserdisposisiDropdown with CustomDropdownListFilter {
  final String id;
  final String name;
  final String unitkerja;
  final int countpendingots;
  final int countpendingdesk;
  const ListuserdisposisiDropdown(this.id, this.name, this.unitkerja,
      this.countpendingots, this.countpendingdesk);

  @override
  String toString() {
    return name;
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }
}
