import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';
import 'package:personalfit/modules/domain/entities/personal.dart';
import 'package:provider/provider.dart';
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/modules/presentation/controllers/confirmationpage_controller.dart';

class ConfirmationPage extends StatelessWidget {
  final Personal personal;

  const ConfirmationPage({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfirmationController(personal: personal),
      child: const _ConfirmationPageBody(),
    );
  }
}

class _ConfirmationPageBody extends StatelessWidget {
  const _ConfirmationPageBody();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ConfirmationController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmação", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF2F6690),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Modalidade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Online'),
                    value: 'online',
                    groupValue: controller.modality,
                    onChanged: controller.setModality,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Presencial'),
                    value: 'presencial',
                    groupValue: controller.modality,
                    onChanged: controller.setModality,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Frequência',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<int>(
              value: controller.freq,
              items: List.generate(5, (index) => index + 1)
                  .map((num) => DropdownMenuItem(value: num, child: Text('$num')))
                  .toList(),
              onChanged: controller.setFreq,
              isExpanded: true,
              underline: Container(height: 2, color: AppColors.dark),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$ ${controller.price}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final message = await controller.submitContactInterest();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Contato Criado com sucesso!',),
                      backgroundColor: message == null ? AppColors.success : AppColors.error,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Confirmar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
