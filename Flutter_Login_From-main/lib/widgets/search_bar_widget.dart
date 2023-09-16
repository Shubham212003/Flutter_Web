import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget{
  SearchBarWidget({Key? key}): preferredSize = const Size.fromHeight(kAppBarHeight),super(key: key);

   @override
   final Size preferredSize;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Container(

    );
   }
}