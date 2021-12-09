import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class TemplateModal extends HookWidget {
  final String name;
  final bool barrierDismissible;

  const TemplateModal({
    Key? key,
    required this.name,
    this.barrierDismissible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      content: WillPopScope(
        onWillPop: () async => barrierDismissible,
        child: DefaultTextStyle(
          style: const TextStyle(),
          textAlign: TextAlign.center,
          child: buildContent(context),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context);

  Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) => this,
      routeSettings: RouteSettings(name: name),
      useRootNavigator: true,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black,
    );
  }
}
