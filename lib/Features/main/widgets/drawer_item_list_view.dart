import 'package:flutter/material.dart';

import 'drawer_item_model.dart';


class DrawerItemListView extends StatefulWidget {
  const DrawerItemListView({
    super.key,

    required this.drawerItems,
    required this.itemBuilder,
  });


  final List<DrawerItemModel> drawerItems;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  State<DrawerItemListView> createState() => _DrawerItemListViewState();
}

class _DrawerItemListViewState extends State<DrawerItemListView> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.drawerItems.length,
      itemBuilder: widget.itemBuilder,
    );
  }
}
