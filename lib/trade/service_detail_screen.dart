import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';

class ServiceDetailScreen extends ConsumerStatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  ServiceDetailScreenState createState() => ServiceDetailScreenState();
}

class ServiceDetailScreenState extends ConsumerState<ServiceDetailScreen> {
  List<String> img = [
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/masaje1.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/masaje2.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/masaje3.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/masaje4.jpg',
  ];
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
        title: const Text('ServiceDetail Screen'),
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
                        'Relajación Total Spa',
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
                      'Ofrecemos masajes terapéuticos, faciales rejuvenecedores y tratamientos corporales con productos naturales. Nuestro equipo de expertos te guiará hacia la relajación total en un ambiente sereno. Regálate un momento de paz y revitalización.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  //FlutterCarousel
                  CarouselLi(img: img),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonAD(
                        'Adultos: ',
                        onAD: (counter) {},
                      ),
                      ButtonAD(
                        'Niños: ',
                        onAD: (counter) {},
                      )
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  SectionTitle(cardColor: cardColor, title: 'Duracion - Precios'),
                  const SizedBox(height: 10.0),
                  //ContainerCard
                  ContainerCard(
                    margin: const EdgeInsets.all(0.0),
                    cardColor: cardColor.withOpacity(0.3),
                    child: const Text(
                      'Masaje relajante: 1 hora - \$500.00\nMasaje terapéutico: 1 hora - \$600.00\nMasaje de tejido profundo: 1 hora - \$700.00\nMasaje de piedras calientes: 1 hora - \$800.00\nMasaje de aromaterapia: 1 hora - \$900.00\nMasaje deportivo: 1 hora - \$1000.00',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  SectionTitle(cardColor: cardColor, title: 'Caracteristicas'),
                  const SizedBox(height: 10.0),
                  //ContainerCard
                  ContainerCard(
                    margin: const EdgeInsets.all(0.0),
                    cardColor: cardColor.withOpacity(0.3),
                    child: const Text(
                      'Ofrecemos masajes terapéuticos, faciales rejuvenecedores y tratamientos corporales con productos naturales. Nuestro equipo de expertos te guiará hacia la relajación total en un ambiente sereno. Regálate un momento de paz y revitalización.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
