import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/controller_user.dart';
import 'package:test/models/model_user.dart';

class FormUser extends StatefulWidget {
  const FormUser({Key? key}) : super(key: key);
  static String namePage = "/form-user";

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  ControllerUser controllerUser = Get.put(ControllerUser());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: firstName,
              onChanged: (v) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Firts Name",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: lastName,
              onChanged: (v) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Last Name",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            IconButton(
              color: Colors.blue,
              onPressed: () {
                firstName.text.isEmpty || firstName.text.isEmpty
                    ? Get.rawSnackbar(
                        message: "Form tidak boleh kosong",
                        backgroundColor: Colors.red)
                    : controllerUser.addUser(
                        dataUser: ModelUser(
                          firstName: firstName.text,
                          lastName: lastName.text,
                        ),
                      );
              },
              icon: Icon(Icons.save,
                  color: firstName.text.isEmpty || firstName.text.isEmpty
                      ? Colors.grey
                      : Colors.blue),
            )
          ],
        ),
      )),
    );
  }
}
