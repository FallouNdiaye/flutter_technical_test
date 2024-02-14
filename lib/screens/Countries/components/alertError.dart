
import 'package:flutter/material.dart';

void showApiErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Erreur au niveau de l\'api'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(errorMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OUI'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}