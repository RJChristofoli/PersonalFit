import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:personalfit/modules/data/models/ioutput.dart';

const String baseUrl = 'https://688be45dcd9d22dda5cb9877.mockapi.io';
//GET ALL PERSONALS
Future <Output> getPersonals() async {
  try{
  final response = await http.get(Uri.parse('${baseUrl}/personals'));
  if(response.statusCode == 200){
    final List<dynamic> data = json.decode(response.body);
    return Output(
      success: true,
      message: "Open data successfully!",
      statusCode: response.statusCode,
      data: data,
    );
  }else {
      return Output(
        success: false,
        message: "Request error!",
        statusCode: response.statusCode,
      );
    }
  }catch(error){
    return Output(
      success: false, 
      message: "Request error!", 
      statusCode: 0
      );
  }
}

Future <Output> createContactInterest({required String personalId,
required String modality, 
required String frequency, 
required double price}) async {
  try{
    final Map<String,dynamic> body = {
      'personalId': personalId,
      'modality': modality,
      'frequency': frequency,
      'estimatedPrice': price
    };
    final response = await http.post(
      Uri.parse('${baseUrl}/contact-interest'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if(response.statusCode == 201 || response.statusCode == 200){
      final data = json.decode(response.body);
      return Output(
        success: true,
        message: 'Contact interest create sucefully!',
        statusCode: response.statusCode,
        data:data
      );
    }else{
      return Output(success: false,
       message: 'Request error!', 
       statusCode: response.statusCode);
    }
  }catch(error){
    return Output(
      success: false, 
      message: "Request error!", 
      statusCode: 0
      );
  }
}