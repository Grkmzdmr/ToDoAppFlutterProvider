
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider_egitim/models/todo.dart';

class HomeViewModel extends ChangeNotifier{

  List<Todo> todos = [];

  //bu listeden bir şey silip ekleyemiyoruz.
  UnmodifiableListView<Todo> get allTodos => UnmodifiableListView(todos);
  UnmodifiableListView<Todo> get completedTodos => UnmodifiableListView(todos.where((todo) => todo.completed));
  UnmodifiableListView<Todo> get  unCompletedTodos => UnmodifiableListView(todos.where((todo) => !todo.completed));

  void addTodo(Todo todo){
    todos.add(todo);
    //NotifyListeners provider paketi ile birlikte geliyor örnek için anlatacak olursam.
    // to do listesinde değişiklik var bunu render et yani değişikliği tüm bu listenin kullandığı yerlerde göster.
    notifyListeners();
  }

  void removeTodos(Todo todo){
    //to donun indexini buluyoruz.
    int index = todos.indexOf(todo);

    //listeden siliyoruz ve notifyListenersla haber veriyoruz.
    todos.removeAt(index);
    notifyListeners();

  }

}