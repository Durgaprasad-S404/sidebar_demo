import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    Key? key,
    required this.tabItems,
    required this.onTapped,
  }) : super(key: key);

  final List<String> tabItems;
  final Function(String) onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: tabItems.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTapped(tabItems[index]);
            },
            child: Column(
              children: [
                Text(
                  tabItems[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
