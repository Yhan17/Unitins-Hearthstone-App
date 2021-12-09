import 'package:flutter/material.dart';

import 'template_modal.dart';

class ErrorModal extends TemplateModal {
  const ErrorModal({Key? key}) : super(key: key, name: 'error_modal');

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        const Text('Deu erro meu bom'),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
