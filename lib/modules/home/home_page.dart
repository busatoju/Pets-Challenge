import 'package:flutter/material.dart';
import 'package:pets_challenge/modules/home/controller/home_controller.dart';
import 'package:pets_challenge/modules/home/widgets/menu_home_widget.dart';
import 'package:pets_challenge/shared/models/animal_model.dart';
import 'package:provider/provider.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                height: size.height * .85,
                width: size.width,
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Consumer<HomeController>(
                  builder: (context, value, child) => Column(
                    children: [
                      MenuHomeWidget(
                        currentIndex: value.currentIndex,
                        onChanged: (index) => value.setCurrentIndex = index,
                      ),
                      Container(
                        height: size.height * .748,
                        padding:
                            const EdgeInsets.only(top: 12, left: 12, right: 12),
                        child: FutureBuilder(
                            future: value.get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                final list = snapshot.data as List;
                                return ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: list.length,
                                    itemBuilder: (_, index) {
                                      final AnimalModel animal = list[index];
                                      return CardWidget(
                                        name: animal.name,
                                        age: animal.age,
                                        image: animal.image,
                                        isFavorite: animal.isFavorite,
                                        onFavorite: () {},
                                        breed: animal.breed,
                                        gender: animal.gender,
                                      );
                                    });
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(child: Text('${snapshot.error}'));
                              } else {
                                return Container();
                              }
                            }),
                      ),
                    ],
                  ),
                )),
            AppBarWidget(size: size),
          ],
        ),
      ),
    );
  }
}
