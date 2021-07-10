/// Flutter code sample for AlertDialog

// This demo shows a [TextButton] which when pressed, calls [showDialog]. When called, this method
// displays a Material dialog above the current contents of the app and returns
// a [Future] that completes when the dialog is dismissed.

import 'dart:io';

import 'package:flutter/material.dart';

/// This is the main application widget.
class Loading {

  /**
   * Muestra loading para esperar la respuesta del servicio a invocar
   *
   * @author Bryan Zamora
   * @param context
   * @param @isShow
   */
  showLoading(BuildContext context,bool isShow) {

    if(isShow) {
      var alert = Container(
          child: Image.asset(
              'assets/loading.gif', scale: 10, width: 100, height: 200)
      );
      // show the dialog
      showDialog(
          context: context,
          useRootNavigator: isShow,
          builder: (BuildContext context) => alert
      );
    }else{
      Navigator.pop(context);
    }
  }
}
