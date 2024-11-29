import 'package:flutter/material.dart';

class BigErrorMsg extends StatelessWidget {
  final String textHeadline;

  const BigErrorMsg({super.key, required this.textHeadline});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        textHeadline,
        textAlign: TextAlign.center,
        maxLines: null,
        softWrap: true,
        style: TextStyle(
          fontSize: 25,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onErrorContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes redondeados.
      ),
      behavior: SnackBarBehavior.floating,
      // Hace que el SnackBar sea flotante.
      margin:
          EdgeInsets.all(16), // Margen para separar el SnackBar de los bordes.
    );
  }
}
