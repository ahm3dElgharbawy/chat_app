import 'package:chat_app/core/common_widgets/main_appbar.dart';
import 'package:chat_app/features/calls/presentation/views/widgets/calls_body.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
      body: CallsBody()
    );
  }
}
