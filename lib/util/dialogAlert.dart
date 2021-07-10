/// Flutter code sample for AlertDialog

// This demo shows a [TextButton] which when pressed, calls [showDialog]. When called, this method
// displays a Material dialog above the current contents of the app and returns
// a [Future] that completes when the dialog is dismissed.

import 'package:flutter/material.dart';

/// This is the main application widget.
class DialogAlert {

  /**
   * Muestra la advertencia sobre un error 400
   *
   * @author Bryan Zamora
   * @param context
   * @param @strMessage
   */
  showAlertDialog(BuildContext context,String strMessage) {

    AlertDialog alert = AlertDialog(
                            title: const Text('Alerta'),
                            content: Text(strMessage),
                            actions: <Widget>[
                                          TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                                          child: const Text('Cancelar'),
                                          ),
                                          TextButton(
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                                          ),
                                          ]
                              );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) =>alert
    );
  }
}
