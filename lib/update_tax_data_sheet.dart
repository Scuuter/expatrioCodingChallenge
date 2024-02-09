import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class UpdateTaxData extends StatefulWidget {
  const UpdateTaxData({Key? key}) : super(key: key);

  @override
  _UpdateTaxDataState createState() => _UpdateTaxDataState();
}

class _UpdateTaxDataState extends State<UpdateTaxData> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Personal Information"),
            Form(
                child: Column(
              children: [
                DropdownSearch<String>(),
                TextButton(onPressed: () {}, child: const Text("ADD ANOTHER")),
                FilledButton(onPressed: () {}, child: const Text("SAVE")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
