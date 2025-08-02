import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';
import 'package:personalfit/modules/presentation/widgets/personal_details.dart';
import 'package:personalfit/modules/presentation/widgets/specialities_list.dart';

class DetailsPage extends StatelessWidget {
  final Personal personal;  
  const DetailsPage({super.key,  required this.personal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detalhes',
        style: TextStyle(color:Colors.white),),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      personal.photoUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(child: PersonalDetails(personal: personal,)),
                ],
              ),

              SizedBox(height: 20),
              Text(
                'Especialidades',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              SpecialitiesList(specialities: personal.specialties),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Nota ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text((personal.rating.toString()), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Icon(Icons.star, color: Colors.orange, size: 16),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Biografia',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                (personal.bio),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
