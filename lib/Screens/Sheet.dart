import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';

class Sheet extends StatefulWidget {
  final Widget child;
  final Widget screen;
  final double max;
  final double init;
  const Sheet({super.key,required this.child,required this.screen,required this.max,required this.init});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {

  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged(){
    final currentSize = controller.size;
    if(currentSize <= 0.05){
collapse();
    }
  }
  void collapse()=>animeSheet(0.05);
  void anchor()=>animeSheet(0.6);

  void animeSheet(double size){
controller.animateTo(size, duration: const Duration(microseconds: 50), curve: Curves.easeInOut);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder,constraints){
      return DraggableScrollableSheet(key: sheet,initialChildSize:widget.init,maxChildSize: widget.max,minChildSize: 0.05,expand:true,
          snap:true,snapSizes: [
            60 / constraints.maxHeight, widget.max
          ],  builder: (BuildContext context,
      ScrollController scrollController)
      {
        return DecoratedBox(decoration:
        BoxDecoration(
          color:backgroundColor,
          boxShadow : const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 20,
              spreadRadius: 20,
              offset: Offset(0, 30)
            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20) )
        ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
          child:
              Column(
                children: [
                  widget.screen,
                   widget.child,
                ],
              ),
          ),
        ]
        ),
        );
      });
    });
  }
}
