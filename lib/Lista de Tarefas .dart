import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'to do list',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _tasks = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Lista de Tarefas',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      controller: taskController,
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                      decoration: InputDecoration(
                          hintText: 'Escreva uma tarefa aqui ...',
                          hintStyle: TextStyle(fontSize: 20)),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return ' O Campo de tarefa é obrigatório';
                        }
                        return null;
                      },
                    )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: RaisedButton(
                          child: Text(
                            'Add',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            print('CLIQUEI');
                            if (_formKey.currentState.validate())
                              setState(() {
                                _tasks.add(taskController.text);
                              });
                            taskController.clear();
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tasks[index]),
                    ),
                  );
                },
              ),
            )
          ])),
    );
  }
}
