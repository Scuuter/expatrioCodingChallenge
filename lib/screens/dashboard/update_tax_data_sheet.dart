import 'package:coding_challenge/models/country.dart';
import 'package:coding_challenge/models/tax_residence.dart';
import 'package:coding_challenge/services/user_tax_data_provider.dart';
import 'package:coding_challenge/shared/text_input_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class UpdateTaxData extends StatefulWidget {
  const UpdateTaxData({Key? key}) : super(key: key);

  @override
  _UpdateTaxDataState createState() => _UpdateTaxDataState();
}

class _UpdateTaxDataState extends State<UpdateTaxData> {
  final taxDataProvider = UserTaxDataProvider();

  late List<TaxResidence> residencies;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.5,
      builder: (context, scrollController) => Column(
        children: [
          const Text("Personal Information"),
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 2))
                .then((value) => taxDataProvider.getTaxResidence()),
            builder: (
              BuildContext context,
              AsyncSnapshot<Set<TaxResidence>> snapshot,
            ) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                var countries = Country.availableCountries.toSet();
                var residencies =
                    snapshot.requireData.map((residence) => residence.country);
                countries.removeAll(residencies);
                return Form(
                    child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      for (var residence in snapshot.requireData)
                        ResidenceChooserWidget(
                          list: countries.toList(),
                          currentResidence: residence,
                        ),
                      TextButton(
                          onPressed: () {}, child: const Text("ADD ANOTHER")),
                      FilledButton(onPressed: () {}, child: const Text("SAVE")),
                    ],
                  ),
                ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

class ResidenceChooserWidget extends StatefulWidget {
  final TaxResidence? currentResidence;
  final List<Country> list;

  const ResidenceChooserWidget({
    super.key,
    required this.list,
    this.currentResidence,
  });

  @override
  State<ResidenceChooserWidget> createState() => _ResidenceChooserWidgetState();
}

class _ResidenceChooserWidgetState extends State<ResidenceChooserWidget> {
  @override
  void initState() {
    if (widget.currentResidence != null) {
      widget.list.add(widget.currentResidence!.country);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownSearch<Country>(
            itemAsString: (country) => country.label,
            items: widget.list,
            selectedItem: widget.currentResidence?.country,
          ),
        ),
        const TextInputField(
            label: 'Tax ID', validatorMessage: 'Please enter your Tax ID'),
      ],
    );
  }
}
