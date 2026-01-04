import 'package:flutter/material.dart';

class ServiceListTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final DateTime date;
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
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date.toString()),
      leading: Icon(icon, color: color),
      trailing: Text(
        price.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
