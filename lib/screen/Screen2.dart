import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/ListBLoc2.dart';
import '../widget/ListItem2.dart';

class Screen2 extends StatelessWidget {
  static String id = 'Screen2';
  const Screen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        backgroundColor: Color(0xFF3D9098),
      ),
      body: Center(
        child: Consumer<ListBLoc2>(
          builder: (context, _listBLoc2, child) {
            return StreamBuilder(
              initialData: [],
              stream: _listBLoc2.stream,
              builder: (context, snapshot) {
                var value = snapshot.data;
                return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ListItem2(title: value[index].toString());
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
