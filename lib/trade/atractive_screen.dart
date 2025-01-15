import 'package:ahangoapp/widgets/icon_button_ink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';

class AtractiveScreen extends ConsumerStatefulWidget {
  const AtractiveScreen({super.key});

  @override
  AtractiveScreenState createState() => AtractiveScreenState();
}

class AtractiveScreenState extends ConsumerState<AtractiveScreen> {
  List<String> img = [
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Servicio4.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Servicio1.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Servicio3.jpg',
  ];
  bool seeMap = false;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).cardColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: const Text('Atractive Screen'),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            //Cotenedor
            ContainerCard(
              cardColor: cardColor.withOpacity(0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //TEXT Bacalar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'EcoAventura Maya',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10.0),
                          IconButtonInk(
                            onTap: () {},
                            icon: Icons.play_arrow,
                          ),
                          const SizedBox(width: 10.0),
                          IconButtonInk(
                            onTap: () {},
                            icon: Icons.replay_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  //ContainerCard Bacalar
                  ContainerCard(
                    margin: const EdgeInsets.all(0.0),
                    cardColor: cardColor.withOpacity(0.3),
                    child: const Text(
                      'Atractivo turístico en Quintana Roo que te lleva a explorar la selva maya. Ofrecemos recorridos a cenotes, tirolesas y senderismo con guías locales. Disfruta de una experiencia sostenible, incluyendo un almuerzo con platillos tradicionales de la región. Conéctate con la naturaleza y la cultura en una aventura única.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  //FlutterCarousel
                  CarouselLi(img: img),
                  const SizedBox(height: 30.0),
                  SectionTitle(cardColor: cardColor, title: 'Costos'),
                  const SizedBox(height: 10.0),
                  ContainerCard(
                    cardColor: cardColor.withOpacity(0.3),
                    margin: const EdgeInsets.all(0.0),
                    width: 400.0,
                    child: const Text(
                      '- Adultos: \$100.00\n- Niños: \$50.00\n- Adultos mayores: \$50.00\n- Personas con discapacidad: \$50.00\n- Niños menores de 5 años: Gratis',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  SectionTitle(cardColor: cardColor, title: 'Reglas'),
                  const SizedBox(height: 10.0),
                  ContainerCard(
                    cardColor: cardColor.withOpacity(0.3),
                    margin: const EdgeInsets.all(0.0),
                    width: 400.0,
                    child: const Text(
                      '- No se permite fumar en las instalaciones\n- No se permite el acceso a mascotas\n- No se permite el acceso a menores de 18 años sin la compañía de un adulto\n- No se permite el acceso a personas en estado de ebriedad\n- No se permite el acceso a personas con actitudes agresivas',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
