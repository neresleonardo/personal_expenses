import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transaction = [
    Transaction(id: 't1', title: 'Cinema', value: 300, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de Luz', value: 300, date: DateTime.now()),
    Transaction(id: 't3', title: 'Academia', value: 300, date: DateTime.now()),
    Transaction(id: 't4', title: 'Netflix', value: 300, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suas despesas"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Color.fromARGB(255, 17, 167, 24),
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transaction.map((tr) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 1,
                    )),
                    padding: EdgeInsets.all(10),
                    child: Text('R\$ ${tr.value.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple[600])),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.purple[600]),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 190, 190, 190),
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: valueController,
                  decoration: InputDecoration(labelText: 'Valor'),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        child: Text('Nova Transação'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[400],
                        ),
                        onPressed: () {
                          print(titleController.text);
                           print(valueController.text);
                        },
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
