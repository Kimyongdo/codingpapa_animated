import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListModel<E>{ //<T>와 같음, 어떤 것을 넣어도 됨. 
  
  final List<E> _items;
  final GlobalKey<AnimatedListState> listKey;

  AnimatedListState get _animatedList => listKey.currentState;//현재 상태를 가져옴. 

  ListModel({@required Iterable<E> initialItems, @required this.listKey})//List는 Iterable의 하위개념,어떤 List도 받겠다. 
  :
    assert(listKey != null),
   assert(initialItems !=null), //assert : 컴파일타임에 null이라면 알려준다.  
  _items = List<E>.from(initialItems ?? <E>[]); //?? : null이라면 뒤에것을 줘 (null주지 말고)

  void insert(int index, E item){
    _items.insert(index, item);//번호랑 아이템을 넣어준다.
    _animatedList.insertItem(index);
  }
  
  E removeAt(int index, E item){
    final removeItem = _items.removeAt(index);
    return removeItem;
  }
  
  int get lenght { //get을 쓰면 ()을 제외할수 있음
    return _items.length;
  }

  //operator []란? index에 맞는 배열을 꺼내서 index에 넣어줘라. 
  //list[index]에서의 []을 의미함. 
  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item); //몇번째에 있는가




}