import 'package:flutter/material.dart';

import 'home_page.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
      letterSpacing: 1,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Pedido de Auxilio"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomePage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Usted ha emitido una alerta al Grupo de Rescate local con su ubicacion y datos de contacto, pronto se pondran en contacto con usted",
                    textAlign: TextAlign.center,
                    style: myStyle),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Telefonos utiles: ",
                  style: myStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Bomberos: 123456", style: myStyle),
                Text("Policia: 123456", style: myStyle),
                Text("Grupo de Rescate: 123456", style: myStyle),
                Text("Mi contacto de emergencia: 123456", style: myStyle),
              ]),
        ),
      ),
    );
  }
}
