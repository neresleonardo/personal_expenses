
import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

 final _transaction = [
    Transaction(id: 't1', title: 'Cinema', value: 300, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 300, date: DateTime.now()),
    Transaction(id: 't3', title: 'Academia', value: 300, date: DateTime.now()),
    Transaction(id: 't4', title: 'Netflix', value: 300, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transaction),
        TransactionForm()
      ],
    );
  }
}