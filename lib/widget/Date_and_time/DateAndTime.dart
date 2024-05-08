

import 'package:intl/intl.dart';

class Date_And_Time {

  String getDateFormate(String _date) {
    if(_date!=''){
      DateTime? _currentDate = DateTime.tryParse(_date);
      var date = DateFormat('dd-MM-yyyy').format(_currentDate!);
      return date;
    }else{
      return '';
    }

  }
}
