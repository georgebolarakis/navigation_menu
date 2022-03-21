import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Caategory {
  final String id;
  final String title;
  final Color color;

  const Caategory({
    required this.id,
    required this.title,
    this.color = Colors.amber,
  });
}
