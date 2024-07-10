import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/router/routes/page/app_page.dart';
import 'package:maat_router_poc/router/routes/page/page_ids.dart';

class ItemPage extends MaatPage {
  ItemPage({
    required String item,
  }) : super(
          pageId: PageId.item,
          builder: (context) => ItemScreen(item: item),
        );
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({
    super.key,
    required this.item,
  });

  final String item;

  @override
  Widget build(BuildContext context) {
    return MaatScaffold(
      key: PageStorageKey(item),
      title: 'Item $item',
    );
  }
}
