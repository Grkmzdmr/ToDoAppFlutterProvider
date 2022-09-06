import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_egitim/models/home_viewmodel.dart';
import 'package:provider_egitim/models/todo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          showAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: Column(
        children:  [
          Expanded(
            child: Consumer<HomeViewModel>(
              builder: (context,state,child){
                return ListView.builder(
                itemCount: state.allTodos.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                      title: Text(state.allTodos[index].title),
                      subtitle: Text(state.allTodos[index].description ?? ""),


    ),
                      Divider(),
                    ],
                  );
    }



                );
    }

              ),
            ),

        ],
      ),

    );
  }
  showAlertDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    Widget addButton = ElevatedButton(onPressed: (){
      if(formKey.currentState!.validate()){


      Todo todo = Todo(titleController.text,descController.text,false);
        Provider.of<HomeViewModel>(context,listen: false).addTodo(todo);
        titleController.text = '';
        descController.text = '';
        Navigator.pop(context);
      }


    }, child: Text('Add Todo'));
    Widget cancelButton = TextButton(onPressed: (){
      Navigator.pop(context);
    },child: Text('Cancel'),);


    AlertDialog alertDialog = AlertDialog(
      title: Text('Add Todo'),
      content: Form(
        key: formKey,
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextFormField(
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                ),
                controller: titleController,
                validator: (value){
                  if(value!.isEmpty) {
                    return 'Please write title';
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                ),
               validator: (value) {
                 if(value!.isEmpty) {
                   return 'Please write description';
                 }
               },
                controller: descController,
              )
            ],
          ),
        ),
      ),
      actions: [
        addButton,
        cancelButton
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
}
