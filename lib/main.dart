
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
   BlocOverrides.runZoned(
         () => runApp(AppMultiBlocProvider()),
     // blocObserver: ,
   );
}