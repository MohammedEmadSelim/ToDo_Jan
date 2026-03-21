import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/todo_model.dart';
import '../models/todo_param.dart';
import 'home_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  var user = FirebaseAuth.instance.currentUser;
  Future<String> createTodo(TodoParam todo) async {
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
        if (todo.image != null)"image": imageUrl,
      });
      return "200";
    } catch (E) {
      print(E.toString());
      return E.toString();
    }
  }
  @override
  Future<Either<String, List<TodoModel>>> getTodo() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection(user!.uid)
          .get();
      var todos = response.docs.map((e) {
        return TodoModel.fromJson(e.data(),e.id);
      }).toList();
      return Right(todos);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<String> deleteTodo(String todoId)async {
    try{
      await FirebaseFirestore.instance.
      collection(user!.uid).doc(todoId).delete();
      return "200";
    }catch(e){
      return e.toString();
    }
  }

  @override
  Future<String> editTodo(String todoId, TodoParam todo) async {
    try {
      String? imageUrl;

      if (todo.image != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('${user!.uid}/$todoId.jpg');

        await storageRef.putFile(todo.image!);
        imageUrl = await storageRef.getDownloadURL();
      }

      await FirebaseFirestore.instance
          .collection(user!.uid)
          .doc(todoId)
          .set({
        "title": todo.title,
        "des": todo.des,
        "deadline": todo.deadline,
        if (imageUrl != null) "image": imageUrl,
      }, SetOptions(merge: true));

      return "200";
    } catch (e) {
      return e.toString();
    }
  }
}
