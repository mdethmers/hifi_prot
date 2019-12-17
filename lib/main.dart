import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hifi_prot/providers/Provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(value: classProvider())
      ],
    );
  }


}