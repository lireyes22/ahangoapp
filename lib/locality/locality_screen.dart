import 'package:ahangoapp/config/config.dart';
import 'package:ahangoapp/config/utils/map_style.dart';
import 'package:ahangoapp/models/trade_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalityScreen extends ConsumerStatefulWidget {
  const LocalityScreen({super.key});
  @override
  LocalityScreenState createState() => LocalityScreenState();
}

class LocalityScreenState extends ConsumerState<LocalityScreen> {
  final _appGoogleMap = AppGoogleMap();

  List<TradeModel> trades = [
    TradeModel(id: '', name: 'La fondita 1', type: 'restaurant', valoration: 5, images: [])
  ];

  Map<String, bool> typesFilter = {
    'Hospedaje': false,
    'Alimentos': false,
    'Transporte': false,
    'Servicios': false,
    'Atractivos': false,
  };



  List<String> img = [
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg',
    'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg',
  ];
  bool seeMap = false;

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locality Screen'),
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
                        'Bacalar',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButtonInk(
                            onTap: () {
                              setState(() {
                                seeMap = !seeMap;
                              });
                            },
                            icon: seeMap
                                ? Icons.image_outlined
                                : Icons.map_outlined,
                          ),
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
                      'Bacalar o Laguna de los siete colores, es una laguna ubicada en el estado de Quintana Roo, muy cerca de Chetumal, la capital de ése estado. La palabra maya Bakhalal “cerca o rodeado de carrizos”.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  /////////// MAPA ///////////
                  if (seeMap)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 400,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: GoogleMap(
                          style: mapStyle,
                          onMapCreated: _appGoogleMap.onMapCreated,
                          //zoomControlsEnabled: false,
                          mapType: MapType.terrain,
                          initialCameraPosition: const CameraPosition(
                            zoom: 15,
                            target: LatLng(18.6836535, -88.3860595),
                          ),
                        ),
                      ),
                    ),
                  //FlutterCarousel
                  if (!seeMap) CarouselLi(img: img),
                  const SizedBox(height: 30.0),
                  //SECTION COMERCIOS
                  SectionTitle(cardColor: cardColor, title: 'Comercios'),
                  const SizedBox(height: 10.0),
                  //Filtros
                  
                  FilterRow(
                    children: [
                      IconButtonLi(
                        onPressed: (isSelected) {
                          setState(() {
                            typesFilter['Hospedaje'] = isSelected;
                          });
                        },
                        icon: const Icon(Icons.hotel),
                        label: 'Hospedaje',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {
                          setState(() {
                            typesFilter['Alimentos'] = isSelected;
                          });
                        },
                        icon: const Icon(Icons.restaurant),
                        label: 'Alimentos',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {
                          setState(() {
                            typesFilter['Transporte'] = isSelected;
                          });
                        },
                        icon: const Icon(Icons.local_taxi),
                        label: 'Transporte',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {
                          setState(() {
                            typesFilter['Servicios'] = isSelected;
                          });
                        },
                        icon: const Icon(Icons.tour_outlined),
                        label: 'Servicios',
                      ),
                      IconButtonLi(
                        onPressed: (isSelected) {
                          setState(() {
                            typesFilter['Atractivos'] = isSelected;
                          });
                        },
                        icon: const Icon(Icons.beach_access),
                        label: 'Atractivos',
                      ),
                    ],
                  ),
                  ModelCard(
                    urlImage: 'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Fondita1.jpeg',
                    title: 'La fondita 1',
                    description:
                        'El ambiente es acogedor, con una decoración que combina elementos rústicos y elegantes, creando un espacio ideal para disfrutar de una comida inolvidable. La atención es esmerada y cálida, haciendo que cada visitante se sienta como en casa desde el primer momento.',
                    onTap: () {
                      ref.read(appRouterProvider).goNamed('restaurant');
                    },
                    footer: const ModelCardFooterLocality(),
                  ),
                  ModelCard(
                    urlImage: 'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/Servicio4.jpg',
                    title: 'EcoAventura Maya',
                    description:
                        'Atractivo turístico en Quintana Roo que te lleva a explorar la selva maya. Ofrecemos recorridos a cenotes, tirolesas y senderismo con guías locales. Disfruta de una experiencia sostenible, incluyendo un almuerzo con platillos tradicionales de la región. Conéctate con la naturaleza y la cultura en una aventura única.',
                    onTap: () {
                      ref.read(appRouterProvider).goNamed('atractive');
                    },
                    footer: const ModelCardFooterLocality(),
                  ),
                  ModelCard(
                    urlImage: 'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/spa1.jpeg',
                    title: 'Relajación Total Spa',
                    description:
                        'Ofrecemos masajes, faciales rejuvenecedores y tratamientos corporales con productos naturales. Nuestro equipo de expertos te guiará hacia la relajación total en un ambiente sereno. Regálate un momento de paz y revitalización.',
                    onTap: () {
                      ref.read(appRouterProvider).goNamed('services');
                    },
                    footer: const ModelCardFooterLocality(),
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

class ModelCardFooterLocality extends StatefulWidget {
  
  const ModelCardFooterLocality({super.key});

  @override
  State<ModelCardFooterLocality> createState() => _ModelCardFooterLocalityState();
}

class _ModelCardFooterLocalityState extends State<ModelCardFooterLocality> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 5.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < 5; i++)
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 24,
                ),
                IconButtonActive(
                  onTap: (isSelected){},
                  iconSelected: const Icon(Icons.favorite, color: Colors.red,),
                  iconNotSelected: const Icon(Icons.favorite_border_outlined, color: Colors.red,),
                  
                ),
            ],
          ),
        ),
      ),
    );
  }
}
