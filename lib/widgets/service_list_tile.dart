import 'package:flutter/material.dart';

class ServiceListTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String date;
  final int price;

  const ServiceListTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        leading: Icon(icon, color: color, size: 38),
        trailing: Text(
          '${price.toString()}\$',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
