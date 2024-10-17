import 'package:chat_app/core/common_widgets/main_appbar.dart';
import 'package:chat_app/features/status/presentation/views/widgets/statuses_body.dart';
import 'package:flutter/material.dart';

class StatusesScreen extends StatelessWidget {
  const StatusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: StatusesBody()
    );
  }
}
