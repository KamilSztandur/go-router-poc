import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/router/app_page.dart';
import 'package:maat_router_poc/router/page_ids.dart';

class ItemPage extends AppPage {
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
    final subItems = List.generate(50, (index) => index + 1);

    return MaatScaffold(
      key: PageStorageKey(item),
      title: 'Item $item',
      bodySlivers: [
        for (final subItem in subItems)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 8,
              ),
              child: Card(
                child: ListTile(
                  title: Text('Sub item $subItem'),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
