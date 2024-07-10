import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';
import 'package:maat_router_poc/router/routes/page/app_page.dart';
import 'package:maat_router_poc/router/routes/page/page_ids.dart';
import 'package:maat_router_poc/router/routes/routes.dart';

class ItemsPage extends MaatPage {
  ItemsPage()
      : super(
          pageId: PageId.items,
          builder: (context) => const ItemsScreen(),
        );
}

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = List.generate(40, (index) => index.hashCode.toString());

    return MaatScaffold(
      title: 'Items',
      bodySlivers: [
        for (final item in items)
          SliverToBoxAdapter(
            child: _ItemTile(item: item),
          ),
      ],
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({
    required this.item,
  });

  final String item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      child: Card(
        child: Stack(
          children: [
            ListTile(title: Text(item)),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => ItemRoute(item: item).go(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
