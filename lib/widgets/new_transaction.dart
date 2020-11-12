import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx) {
    print('Constractor new transaction widget');
  }

  @override
  _NewTransactionState createState() {
    print('CreateState New transaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  final focus = FocusNode();
  DateTime _selectedDate;
  _NewTransactionState() {
    print('Constractor new Transaction state');
  }
  @override
  void initState() {
    print('InitState()');
    super.initState();
  }

  // @override
  // void didUpdateWidget(NewTransaction oldWidget) {
  //   print('didUpdateWiget()');
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void dispose() {
  //   print('dispose()');
  //   super.dispose();
  // }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (_amountController == null) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0 ) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate==null? _selectedDate=DateTime.now():_selectedDate,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom +10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                // onSubmitted: (_) => submitData(),
                textInputAction: TextInputAction.next,
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(focus);
                },
              ),
              TextField(
                focusNode: focus,
                decoration: InputDecoration(labelText: 'Price'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) {
                  _submitData();
                },
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date chosen!'
                          : 'Picked date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              AdaptiveFlatButton('Choose date', _submitData)
            ],
          ),
        ),
      ),
    );
  }
}
