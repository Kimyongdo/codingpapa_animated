import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int item;
  final VoidCallback onTap; //Function을 안쓰고 VoidCallback을 씀.
  final bool selected;
  final Animation<double> animation;

  const CardItem(
      {Key key, this.item, this.onTap, this.selected, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.primaries[item % Colors.primaries.length], //나머지 순서대로 준다.
        child: ListTile(
          leading: Icon(Icons.star),
          title: Text(
            "번호 : $item ",
            textScaleFactor: 3,
          ),
          subtitle: Text("subtitle"),
          trailing: Icon(Icons.favorite),
          selected: selected,
          onTap: onTap,
        ),
      ),
    );
  }
}
