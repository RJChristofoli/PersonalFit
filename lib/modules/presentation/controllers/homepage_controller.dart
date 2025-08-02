import 'package:flutter/material.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/core/services/personal.services.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';

class HomeController extends ChangeNotifier {
  //VARIABLES
  bool isLoading = true;
  String get searchText => searchController.text;
  final TextEditingController searchController = TextEditingController();
  String? selectedSpeciality;
  List<Personal> allPersonals = [];

  HomeController ( ){
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged(){
    updateSearchText(searchController.text);
  }

  //FILTER FOR SEARCH
  List<Personal> get filteredList {
    return allPersonals.where((personal) {
      //SEARCH BY NAME
      final nameMatch = personal.name.toLowerCase().contains(searchText.toLowerCase());
      //SEARCH BY SPECIALITY
      final specialityMatch = selectedSpeciality == null || personal.specialties.contains(selectedSpeciality);
      return nameMatch && specialityMatch;
    }).toList();
  }
  //GET SPECIALITIES FOR USE IN SEARCH
  List<String> getAllSpecialities() {
    final Set<String> allSpecialities = {};
    for (var personal in allPersonals) {
      allSpecialities.addAll(personal.specialties);
    }
    return allSpecialities.toList();
  }
  //LOAD PERSONALS
  Future<void> loadPersonals(BuildContext context) async {
    isLoading = true;
    notifyListeners();
  //CALLING SERVICE
    final output = await getPersonals();
    if (output.success && output.data != null) {
      final List<dynamic> response = output.data as List<dynamic>;
      allPersonals = response.map((item) => PersonalModel.fromJson(item)).toList();
    } else {
      //ERROR DIALOG
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(output.message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok!'),
              )
            ],
          );
        },
      );
    }

    isLoading = false;
    notifyListeners();
  }
  //UPDATE SEARCH TEXT
  void updateSearchText(String text) {
    notifyListeners();
  }
  //UPDATE THE SPECIALITY THAT WAS SELECT
  void updateSelectedSpeciality(String? speciality) {
    selectedSpeciality = speciality == 'Todos' ? null : speciality;
    notifyListeners();
  }

  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
}
