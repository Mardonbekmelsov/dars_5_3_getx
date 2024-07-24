import 'dart:math';

import 'package:dars_5_3_getx/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.green,
  ];

  List<CardModel> cardList = [];

  List<CardModel> get list => cardList;

  void addCard(String ownerName, String cardNumber, String cardDate) {
    cardList.add(CardModel(
        ownerName: ownerName,
        cardNumber: cardNumber,
        cardDate: cardDate,
        color: colors[Random().nextInt(4)]));
  }
}
