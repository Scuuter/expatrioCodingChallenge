import 'dart:convert';

import 'package:coding_challenge/models/tax_residence.dart';
import 'package:coding_challenge/services/singletons/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

/// Service to handle user tax data on dashboard screen.
/// todo: there should be logic for updating server data with new data from widget.
class UserTaxDataProvider {
  final apiService = GetIt.instance<ApiService>();

  Future<Set<TaxResidence>> getTaxResidence() async {
    var response = await apiService.getTaxData();

    Set<TaxResidence> residencies = {};

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      TaxResidence primary =
          TaxResidence.fromJson(responseData['primaryTaxResidence']);
      residencies.add(primary);

      var secondaryList = (responseData['secondaryTaxResidence'] as List)
          .map((i) => TaxResidence.fromJson(i));

      residencies.addAll(secondaryList);
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }

    return residencies;
  }
}
