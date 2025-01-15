import 'package:ahangoapp/home/helpers/filters.dart';
import 'package:ahangoapp/providers/router_provider.dart';
import 'package:ahangoapp/utils/voice.dart';
import 'package:ahangoapp/widgets/widgetsli.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  //Prueba xd
  Map<String, List<Map<String, String>>> response = {
    'Bacalar': [
      {
        'description':
            'Bacalar, conocido como la Laguna de los Siete Colores, es uno de los destinos más pintorescos de Quintana Roo. El agua azul claro y sus múltiples tonalidades son un atractivo imperdible.',
        'title': 'Laguna de los Siete Colores',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'La fortaleza de San Felipe es un lugar histórico en Bacalar, que ofrece una vista espectacular de la laguna. Es un destino muy visitado por su arquitectura colonial y su historia.',
        'title': 'Fuerte de San Felipe',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Tulum': [
      {
        'description':
            'Tulum es famosa por sus ruinas mayas ubicadas frente al mar Caribe. Es un destino turístico que combina historia, cultura y playas paradisiacas.',
        'title': 'Ruinas de Tulum',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'El Parque Nacional de Tulum incluye la famosa playa de Tulum, conocida por su arena blanca y aguas cristalinas, ideal para relajarse y disfrutar del entorno natural.',
        'title': 'Playa Tulum',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Cozumel': [
      {
        'description':
            'Cozumel es la tercera isla más grande de México, famosa por sus arrecifes de coral y ser un paraíso para el buceo y el esnórquel.',
        'title': 'Arrecifes de Cozumel',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'El Parque Nacional Chankanaab en Cozumel es un lugar popular para la conservación de la flora y fauna marina, ideal para nadar con delfines y practicar buceo.',
        'title': 'Parque Chankanaab',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Holbox': [
      {
        'description':
            'Isla Holbox es una pequeña isla en el norte de la península de Yucatán, conocida por sus aguas tranquilas, playas de arena blanca y la posibilidad de avistar tiburones ballena.',
        'title': 'Playa Punta Coco',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'La Bioluminiscencia en Holbox es uno de los fenómenos más impresionantes del mundo, donde las aguas emiten destellos de luz durante la noche.',
        'title': 'Bioluminiscencia en Holbox',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ]
  };

  Map<String, List<Map<String, String>>> lugares = {
    'Bacalar': [
      {
        'description':
            'Bacalar, conocido como la Laguna de los Siete Colores, es uno de los destinos más pintorescos de Quintana Roo. El agua azul claro y sus múltiples tonalidades son un atractivo imperdible.',
        'title': 'Laguna de los Siete Colores',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'La fortaleza de San Felipe es un lugar histórico en Bacalar, que ofrece una vista espectacular de la laguna. Es un destino muy visitado por su arquitectura colonial y su historia.',
        'title': 'Fuerte de San Felipe',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Tulum': [
      {
        'description':
            'Tulum es famosa por sus ruinas mayas ubicadas frente al mar Caribe. Es un destino turístico que combina historia, cultura y playas paradisiacas.',
        'title': 'Ruinas de Tulum',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'El Parque Nacional de Tulum incluye la famosa playa de Tulum, conocida por su arena blanca y aguas cristalinas, ideal para relajarse y disfrutar del entorno natural.',
        'title': 'Playa Tulum',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Cozumel': [
      {
        'description':
            'Cozumel es la tercera isla más grande de México, famosa por sus arrecifes de coral y ser un paraíso para el buceo y el esnórquel.',
        'title': 'Arrecifes de Cozumel',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'El Parque Nacional Chankanaab en Cozumel es un lugar popular para la conservación de la flora y fauna marina, ideal para nadar con delfines y practicar buceo.',
        'title': 'Parque Chankanaab',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ],
    'Holbox': [
      {
        'description':
            'Isla Holbox es una pequeña isla en el norte de la península de Yucatán, conocida por sus aguas tranquilas, playas de arena blanca y la posibilidad de avistar tiburones ballena.',
        'title': 'Playa Punta Coco',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya1.jpg'
      },
      {
        'description':
            'La Bioluminiscencia en Holbox es uno de los fenómenos más impresionantes del mundo, donde las aguas emiten destellos de luz durante la noche.',
        'title': 'Bioluminiscencia en Holbox',
        'urlImg':
            'https://raw.githubusercontent.com/lireyes22/EkAhanImagesBD/refs/heads/main/rivieramaya2.jpg'
      }
    ]
  };
  bool playOn = false;
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: SearchBar(
            hintText: 'Buscar...',
            backgroundColor: WidgetStatePropertyAll(Color.alphaBlend(
                Colors.black.withOpacity(0.1),
                Theme.of(context).scaffoldBackgroundColor)),
            leading: const Icon(Icons.search),
            onChanged: (value) {
              setState(() {
                lugares = filterLugares(response, value);
              });
            },
          ),
        ),
        ContainerCard(
          cardColor: cardColor.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var lugar in lugares.entries) ...[
                SectionTitle(cardColor: cardColor, title: lugar.key),
                const SizedBox(height: 10.0),
                for (var lugarData in lugar.value) ...[
                  ModelCard(
                    onTap: () {
                      ref.read(appRouterProvider).goNamed('locality');
                    },
                    title: lugarData['title']!,
                    urlImage: lugarData['urlImg']!,
                    description: lugarData['description'],
                    footer: ModelCardFooterHome(
                      onPlayTap: () {
                        if(playOn){
                          pauseTTS();
                        }else{
                          speak(lugarData['description']!);
                        }
                      },
                      onReloadTap: () {
                        resetTTS();
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
                const SizedBox(height: 10.0),
              ],
            ],
          ),
        )
      ],
    );
  }
}

class ModelCardFooterHome extends StatelessWidget {
  final GestureTapCallback onPlayTap;
  final GestureTapCallback onReloadTap;
  const ModelCardFooterHome({
    super.key,
    required this.onPlayTap,
    required this.onReloadTap,
  });

  @override
  Widget build(BuildContext context) {
    Color colorBtn = Theme.of(context).primaryColorDark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: colorBtn,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onPlayTap,
                borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Material(
              color: colorBtn,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onReloadTap,
                borderRadius: BorderRadius.circular(24.0),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  child: const Icon(
                    Icons.replay_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }
}
/**
 * 
 *   @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    final data = ref.watch(getEstacionesProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: SearchBar(
            hintText: 'Buscar...',
            backgroundColor: WidgetStatePropertyAll(Color.alphaBlend(
                Colors.black.withOpacity(0.1),
                Theme.of(context).scaffoldBackgroundColor)),
            leading: const Icon(Icons.search),
            onChanged: (value) {},
          ),
        ),
        ContainerCard(
          cardColor: cardColor.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              data.when(
                  data: (data) {
                    return Column(
                      children: [
                        for (var item in data) ...[
                          SectionTitle(cardColor: cardColor, title: item.attributes.estacionNombre),
                          const SizedBox(height: 10.0),
                          for(var localidad in item.attributes.estacionLocalidades.localidades) ...[
                            ModelCard(
                              onTap: () {
                                 ref.read(appRouterProvider).goNamed('locality');
                              },
                              title: localidad.localidadNombre,
                              description: localidad.localidadDescripcion,
                            ),
                          ],
                          const SizedBox(height: 10.0),
                        ]
                      ],
                    );
                  },
                  error: (e, s) => Text('$e'),
                  loading: () => const CircularProgressIndicator()),
            ],
          ),
        )
      ],
    );
  }
}

 */