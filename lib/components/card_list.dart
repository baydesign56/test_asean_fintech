import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/controller_user.dart';
import 'package:test/models/model_user.dart';

Widget cardList({required ModelUser dataUser, int? index}) {
  ControllerUser controllerUser = Get.put(ControllerUser());
  return Container(
    width: Get.width,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
          )
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                dataUser.firstName ?? "-",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(dataUser.lastName ?? "-")
            ]),
            IconButton(
              onPressed: () {
                controllerUser.delete(index: index!);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        )
      ],
    ),
  );
}
