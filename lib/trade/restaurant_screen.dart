import 'package:ahangoapp/widgets/icon_button_ink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';


class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({super.key});

  @override
  RestaurantScreenState createState() => RestaurantScreenState();
}

class RestaurantScreenState extends ConsumerState<RestaurantScreen> {

  List<String> img = [
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Fondita1.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Fondita4.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Fondita1.jpeg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Fondita4.jpeg',
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
        title: const Text('Restaurant Screen'),
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
                        'La fondita 1',
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
                      'El ambiente es acogedor, con una decoración que combina elementos rústicos y elegantes, creando un espacio ideal para disfrutar de una comida inolvidable. La atención es esmerada y cálida, haciendo que cada visitante se sienta como en casa desde el primer momento.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  //FlutterCarousel
                  CarouselLi(img: img),
                  const SizedBox(height: 30.0),
                  //SECTION COMERCIOS
                  SectionTitle(cardColor: cardColor, title: 'Comercios'),
                  const SizedBox(height: 10.0),
                  //Filtros
                  FilterRow(
                    margin: 20,
                    children: [
                      IconButtonLi(
                        onPressed: (isSelected) {},
                        icon: const Icon(Icons.fastfood),
                        label: 'Comidas',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {},
                        icon: const Icon(Icons.local_cafe),
                        label: 'Bebidas',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {},
                        icon: const Icon(Icons.cake),
                        label: 'Postres',
                      ),
                    ],
                  ),
                  ModelCard(
                    urlImage: img[2],
                    title: 'Pasta a la bolonesa',
                    description:
                        'Los espaguetis a la boloñesa, salsa tradicional de Bolonia, son uno de los platos italianos que más gustan a los niños. Esta deliciosa receta contiene carne, pasta y verduras...',
                    onTap: () {},
                    footer: const ModelCardFooterRestaurant(),
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

class ModelCardFooterRestaurant extends StatelessWidget {
  final double price;
  const ModelCardFooterRestaurant({
    super.key,
    this.price = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 20.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('\$ $price', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}
