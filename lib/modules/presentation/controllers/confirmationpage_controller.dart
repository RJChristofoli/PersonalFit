import 'package:flutter/material.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/core/services/personal.services.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';

// CONTROLLER CONFIRMATION PAGE
class ConfirmationController extends ChangeNotifier {
  final Personal personal;
  String modality = 'online';
  int freq = 1;

  ConfirmationController({required this.personal});

  int get price => freq * personal.price.toInt();

  Future<String?> submitContactInterest() async {
    final output = await createContactInterest(
      personalId: personal.id,
      modality: modality,
      frequency: freq.toString(),
      price: price.toDouble(),
    );
    if (output.success) {
      return null;
    } else {
      return output.message;
    }
  }

  void setFreq(int? newFreq) {
    if(newFreq != null){
      freq = newFreq;
    }
    notifyListeners();
  }

  void setModality(String? newModality) {
    if(newModality != null){
      modality = newModality;
    }
    notifyListeners();
  }
}
