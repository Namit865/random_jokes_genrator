import 'package:flutter/cupertino.dart';
import 'package:random_jokes_genrator/views/Model/index_models.dart';

class indexProvider extends ChangeNotifier{

  navigationBarVariable variable = navigationBarVariable(CurrentIndex: 0);

  void updateIndex(int index){
    variable.CurrentIndex = index;
    notifyListeners();
  }



}