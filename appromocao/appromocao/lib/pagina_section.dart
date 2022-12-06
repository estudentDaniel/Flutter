import 'package:appromocao/pagina_titulos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(
          label: 'Anuncios',
          iconData: Icons.list,
          onTap: () {},
          highlighted: true,
        ),
        PageTitle(
          label: ' Adicionar anuncios',
          iconData: Icons.add,
          onTap: () {},
          highlighted: true,
        ),
        PageTitle(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highlighted: true,
        ),
        PageTitle(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {},
          highlighted: true,
        ),
        PageTitle(
          label: 'Feedback',
          iconData: Icons.feedback,
          onTap: () {},
          highlighted: true,
        ),
      ],
    );
  }
}
