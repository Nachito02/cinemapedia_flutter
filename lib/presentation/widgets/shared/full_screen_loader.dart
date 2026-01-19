import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});




  Stream<String> getLoadingMessages() {

    final messages = <String>[
  'Cargando peliculas...',
  'Buscando pochoclos 🍿',
  'Afinando el proyector 🎬',
  'Desenredando los rollos de film',
  'Convenciendo a los actores',
  'Renderizando drama innecesario',
  'Consultando a Hollywood',
  'Cargando escenas post-creditos',
  'Evitando spoilers...',
  'Preparando la sala',
  'Rebobinando la cinta',
  'Esto esta tardando menos que una pelicula de Scorsese',
  'Probando sonido... uno, dos',
  'Cargando protagonistas',
  'Buscando una buena peli para vos',
];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(stream: getLoadingMessages(), builder: 
            (contex, snapshot) {

              if(!snapshot.hasData) return Text('Cargando...');


              return Text(snapshot.data!);
            }
          )
        ],
      ),
    );
  }
}
