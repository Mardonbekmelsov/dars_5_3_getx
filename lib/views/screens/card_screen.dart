import 'package:dars_5_3_getx/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
  final cardController = Get.put(CardController());

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final dateController = TextEditingController();

  String formatNumber(String number) {
    String formattedNumber = '';
    for (int i = 0; i < number.length; i + 4) {
      formattedNumber += "${number.substring(i, i + 4)} ";
    }
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cards"),
      ),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              itemCount: cardController.list.length,
              itemBuilder: (context, index) {
                final card = cardController.list[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: card.color,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.ownerName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        formatNumber(card.cardNumber),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        card.cardDate,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Text("Add Card"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter owner name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: numberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter card number",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter card date",
                    ),
                  ),
                ],
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    cardController.addCard(nameController.text,
                        numberController.text, dateController.text);
                    nameController.clear();
                    numberController.clear();
                    dateController.clear();
                    Get.back();
                  },
                  child: const Text("Add Card"),
                ),
              ],
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
