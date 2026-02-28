import 'dart:io';
import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:todo_app/features/home_screen/data/models/todo_model.dart';
import 'package:todo_app/features/home_screen/data/models/todo_param.dart';

class HomeRemoteDataSource {
  Future<String> createTodo(TodoParam todo) async {
    var user = FirebaseAuth.instance.currentUser;
    var imageUrl;
    try {
      if (todo.image != null) {
        UploadTask uploadTask;
        // Create a Reference to the file
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('flutter-tests')
            .child('/${user?.uid}${DateTime.now().millisecondsSinceEpoch}.jpg');

        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': todo.image!.path},
        );
        uploadTask = ref.putFile(io.File(todo.image!.path), metadata);
        await uploadTask.then((value) async {
          imageUrl = await ref.getDownloadURL();
          print(imageUrl);
        });
      }
      FirebaseFirestore.instance.collection(user!.uid).add({
        "title": todo.title,
        "des": todo.des,
        "deadline": todo.deadline,
        if (todo.image != null) "image": imageUrl,
      });
      return "200";
    } catch (E) {
      print(E.toString());
      return E.toString();
    }
  }

  Future<Either<String, List<TodoModel>>> getTodos() async {
    var use = FirebaseAuth.instance.currentUser;

    try {
      var response = await FirebaseFirestore.instance
          .collection(use!.uid)
          .get();
      var todos = response.docs.map((e) {
        return TodoModel.fromJson(e.data(), "");
      }).toList();
      return Right(todos);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
