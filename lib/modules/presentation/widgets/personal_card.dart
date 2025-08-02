import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';
import 'package:personalfit/modules/presentation/pages/details.dart';
import 'package:personalfit/modules/presentation/widgets/specialities_list.dart';

class PersonalCard extends StatelessWidget {
  final Personal personal;
  
  const PersonalCard({
    super.key,
    required this.personal
  });
  
  @override
  Widget build(BuildContext context) {
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: // Dentro do Card
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome e nota
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  personal.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(personal.rating.toStringAsFixed(1)),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            // Localização e especialidades
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(personal.city, style: TextStyle(fontSize: 14)),
                SpecialitiesList(specialities: personal.specialties),
              ],
            ),

            // Botão
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dark,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage(personal: personal)),
                    );
                  },
                  child: Text('Detalhes'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
