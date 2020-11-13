import 'package:expenses/components/controler_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  //apresenta o datePicker
  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pinckedDate) {
      if (pinckedDate == null) {
        return;
      }
      onDateChanged(pinckedDate);
    });
  }

  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ControlerPlatform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        :

        //campo da DATA DA TRANSFERENCIA
        Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(this.selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : "Data Selecionada: " +
                          "${DateFormat('d/MM/y').format(this.selectedDate)}"),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('SelecionarData',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}