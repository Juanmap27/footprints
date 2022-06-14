import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

class SliderButton extends StatefulWidget {
  const SliderButton({Key? key}) : super(key: key);

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  @override
  Widget build(BuildContext context) {
    return SlidableButton(
      buttonWidth: 48,
      completeSlideAt: 0.8,
      dismissible: false,
      isRestart: true,
      buttonColor: Colors.red,
      color: Colors.blueGrey[200],
      label: const Text(
        "SOS",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 60,
      onChanged: (position) async {
        if (position == SlidableButtonPosition.right) {
          showDialog(
            context: context,
            builder: (_) => _showAlertDialog(),
          );
        }
      },
      child: const Center(
          child: Text(
        "Deslice para enviar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  _showAlertDialog() {
    return AlertDialog(
      title: const Text("Atención"),
      content: const Text(
          "Usted va a emitir una alerta real ¿Esta seguro que desea continuar?"),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Row(children: const [
                Icon(Icons.arrow_back_outlined),
                Text("  Volver"),
              ]),
            ),
            TextButton(
              onPressed: _callback,
              child: Row(children: const [
                Icon(Icons.arrow_circle_right_outlined),
                Text("  Emitir"),
              ]),
            )
          ],
        ),
      ],
    );
  }

  _callback() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.orange,
      content: Text(
        "Enviando Alerta",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      duration: Duration(seconds: 3),
    ));

    Navigator.of(context).pushNamed("info");
  }
}
