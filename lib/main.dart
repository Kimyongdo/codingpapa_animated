import 'package:codingpapa_animated_list/listModel.dart';
import 'package:flutter/material.dart';
import 'card_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimList(),
    );
  }
}

class AnimList extends StatefulWidget {
  @override
  _AnimListState createState() => _AnimListState();
}

class _AnimListState extends State<AnimList> {
  //AnimatedListState를 따로 만들어서 연결- ??
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  @override
  void initState() {
    //stateful의 생명주기.
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[1, 2, 3] //배열넣는방식이 이런식.
        );
        _nextItem=4;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AimnatedList"),
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle),
              color: Colors.white,
              onPressed: insert),
          IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.white,
              onPressed: null),
        ],
      ),
      body:
        
          AnimatedList(
            key: _listKey,
            initialItemCount: _list.lenght, itemBuilder: _buildItem),
    );
  }

  void insert() {
    //선택된게 없다면 맨 끝에 추가, 있다면 그 뒤에 추가. 
    final int index =
        _selectedItem == null ? _list.lenght : _list.indexOf(_selectedItem);
        _list.insert(index, _nextItem++);
  }

  void remove(){
    if(_selectedItem !=null){
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  Widget _buildItem(
      //index가 계속 생성
      BuildContext context,
      int index,
      Animation<double> animation) {
    //selected: _selectedItem ==_list[index] 선택한 아이템이 같으면 true 다르면 false를 반환.
    return CardItem(
      item: _list[index],
      selected: _selectedItem == _list[index],
      animation: animation,
      onTap: () {
        //onTap를 기점으로 _selectedItem의 값을 넣고 selected가 변환됨.
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }
}
