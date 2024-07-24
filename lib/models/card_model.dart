import 'package:flutter/material.dart';

class CardModel{
  final String ownerName;
  final String cardNumber;
  final String cardDate;
  Color color;

  CardModel({
    required this.ownerName,
    required this.cardNumber,
    required this.cardDate,
    required this.color,
  });
}