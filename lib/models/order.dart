import 'package:flutter/material.dart';

enum OrderStatus { processing, delivered, cancelled }

class OrderModel {
  final String id;
  final DateTime date;
  final double totalAmount;
  final int itemCount;
  final OrderStatus status;
  final String thumbnail;

  OrderModel({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.itemCount,
    required this.status,
    required this.thumbnail,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.processing: return 'PROCESSING';
      case OrderStatus.delivered: return 'DELIVERED';
      case OrderStatus.cancelled: return 'CANCELLED';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.processing: return const Color(0xFFEF6C00);
      case OrderStatus.delivered: return const Color(0xFF2E7D32);
      case OrderStatus.cancelled: return const Color(0xFFC62828);
    }
  }

  Color get statusBg {
    switch (status) {
      case OrderStatus.processing: return const Color(0xFFFFF3E0);
      case OrderStatus.delivered: return const Color(0xFFE8F5E9);
      case OrderStatus.cancelled: return const Color(0xFFFFEBEE);
    }
  }
}
