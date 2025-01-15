import 'package:ahangoapp/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';

class ServicesScreen extends ConsumerStatefulWidget {
  const ServicesScreen({super.key});

  @override
  ServicesScreenState createState() => ServicesScreenState();
}

class ServicesScreenState extends ConsumerState<ServicesScreen> {
  List<String> img = [
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/spa1.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/spa2.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/spa3.jpg',
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
        title: const Text('Services Screen'),
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
                  SectionTitle(cardColor: cardColor, title: 'Servicios'),
                  const SizedBox(height: 10.0),
                  ModelCard(
                    urlImage: 'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/masaje1.jpeg',
                    title: 'Masaje Terapéutico',
                    description:
                        'Los espaguetis a la boloñesa, salsa tradicional de Bolonia, son uno de los platos italianos que más gustan a los niños. Esta deliciosa receta contiene carne, pasta y verduras...',
                    onTap: () {
                      ref.read(appRouterProvider).goNamed('service-detail');
                    },
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
