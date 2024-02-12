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

  Set<TaxResidence?> fetchedResidencies = {};

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
                if (fetchedResidencies.isEmpty) {
                  fetchedResidencies = snapshot.requireData;
                }
                var countries = Country.availableCountries.toSet();
                countries.removeAll(
                    fetchedResidencies.map((residence) => residence?.country));
                return Form(
                    child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      if (fetchedResidencies.isEmpty)
                        ResidenceChooserWidget(list: countries.toList()),
                      for (var residence in fetchedResidencies)
                        ResidenceChooserWidget(
                          list: countries.toList(),
                          initialResidence: residence,
                        ),
                      TextButton(
                          onPressed: () {
                            fetchedResidencies.add(TaxResidence(
                                id: '', countryCode: countries.first.code));
                            setState(() {});
                          },
                          child: const Text("ADD ANOTHER")),
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
  final TaxResidence? initialResidence;
  final List<Country> list;

  ResidenceChooserWidget({
    super.key,
    required this.list,
    this.initialResidence,
  });

  @override
  State<ResidenceChooserWidget> createState() => _ResidenceChooserWidgetState();
}

class _ResidenceChooserWidgetState extends State<ResidenceChooserWidget> {
  TaxResidence? currentResidence;

  final TextEditingController taxIdController = TextEditingController();

  @override
  void initState() {
    if (widget.initialResidence != null) {
      currentResidence = widget.initialResidence;
      widget.list.add(currentResidence!.country);
      taxIdController.text = currentResidence!.id;
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
            selectedItem: widget.initialResidence?.country,
            onChanged: (country) {
              currentResidence = (country == null)
                  ? null
                  : TaxResidence(
                      id: "",
                      countryCode: country.code,
                    );
            },
          ),
        ),
        TextInputField(
          label: 'Tax ID',
          validatorMessage: 'Please enter your Tax ID',
          controller: taxIdController,
        ),
      ],
    );
  }
}
