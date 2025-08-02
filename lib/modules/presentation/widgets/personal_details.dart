import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';
import 'package:personalfit/modules/presentation/pages/confirmation.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalDetails extends StatefulWidget {
  final Personal personal;

  const PersonalDetails({super.key, required this.personal});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  //WHATSAPP API 
  Future<void> openWhatsapp(String number) async {
    final url = Uri.parse('https://wa.me/55$number');
    //IF CAN OPEN WHATSAPP
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Não foi possível abrir o WhatsApp.'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final personal = widget.personal;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            personal.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text('Preço: R\$ ${personal.price} / diária'),
          const SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF16425B),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ConfirmationPage(personal: personal),
                    ),
                  );
                },
                child: const Text('Quero contratar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF16425B),
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () => openWhatsapp(personal.whatsapp),
                child: const Icon(Icons.phone),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
