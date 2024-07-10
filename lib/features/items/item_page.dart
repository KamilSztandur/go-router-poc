import 'package:flutter/material.dart';
import 'package:maat_router_poc/design_system/scaffold.dart';

class ItemPage extends MaterialPage<void> {
  ItemPage({
    required String item,
  }) : super(child: ItemScreen(item: item));
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
