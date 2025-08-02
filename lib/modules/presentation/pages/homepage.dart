import 'package:flutter/material.dart';
import 'package:personalfit/core/constants/app_colors.dart';
import 'package:personalfit/modules/presentation/controllers/homepage_controller.dart';
import 'package:provider/provider.dart'; 
import 'package:personalfit/modules/data/models/personal_model.dart';
import 'package:personalfit/modules/presentation/widgets/personal_card.dart';
import 'package:personalfit/modules/presentation/controllers/homepage_controller.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //CALLING CONTROLLER
      create: (_) => HomeController()..loadPersonals(context),
      child: Consumer<HomeController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('PersonalFit', style: TextStyle(color: Colors.white)),
              backgroundColor: AppColors.primary,
            ),
            body: controller.isLoading
                ? Center(child: CircularProgressIndicator(color: AppColors.primary))
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        //SEARCHBAR
                        child: SearchBar(
                          controller: controller.searchController,
                          hintText: 'Buscar personal...',
                          onChanged: controller.updateSearchText,
                          leading: const Icon(Icons.search),
                          trailing: <Widget>[
                            PopupMenuButton<String>(
                              icon: Icon(Icons.filter_list),
                              tooltip: 'Filtrar por especialidade',
                              onSelected: controller.updateSelectedSpeciality,
                              itemBuilder: (BuildContext context) {
                                final specialities = controller.getAllSpecialities();
                                return [
                                  const PopupMenuItem(value: 'Todos', child: Text('Todos')),
                                  ...specialities.map((spec) => PopupMenuItem(value: spec, child: Text(spec))),
                                ];
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      //PERSONAL CARDS
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 24),
                          itemCount: controller.filteredList.length,
                          itemBuilder: (context, index) {
                            final personal = controller.filteredList[index];
                            return PersonalCard(personal: personal);
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
