import 'package:chat_app/features/status/presentation/views/widgets/statuses_body.dart';
import 'package:flutter/material.dart';

class StatusesScreen extends StatelessWidget {
  const StatusesScreen({super.key});
  static const routeName = "/statuses";
  @override
  Widget build(BuildContext context) {
    return const StatusesBody();
  }
}
