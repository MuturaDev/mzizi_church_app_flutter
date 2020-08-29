import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerBottomSheet extends StatefulWidget {
  DatePickerBottomSheet({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerBottomSheetState();
}

const String MIN_DATETIME = '2020-05-12';
const String MAX_DATETIME = '2100-11-25';
const String INIT_DATETIME = '2020-05-17';

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;
  List<DateTimePickerLocale> _locales = DateTimePickerLocale.values;

  String _format = 'MMMM-dd-yyyy';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _formatCtrl.text = _format;
    _dateTime = defineInitialDate();//DateTime.parse(INIT_DATETIME);
  }

  static const int saturday = 7;

  int daysToAdd(int todayIndex, int targetIndex) {
    if (todayIndex < targetIndex) { // jump to target day in same week
      return targetIndex - todayIndex;
    } else if (todayIndex > targetIndex) { // must jump to next week
      return 7 + targetIndex - todayIndex;
    } else {
      return 0; // date is matched
    }
  }

  DateTime defineInitialDate() {
    DateTime now = DateTime.now();
    int dayOffset = daysToAdd(now.weekday, saturday);
    return now.add(Duration(days: dayOffset));
  }

  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      appBar: AppBar(title: Text('DatePicker Bottom Sheet')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // date format input field
            TextField(
              controller: _formatCtrl,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Date Format',
                hintText: 'yyyy-MM-dd',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              onChanged: (value) {
                _format = value;
              },
            ),
            // selected date
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Selected Date:',
                      style: Theme.of(context).textTheme.subhead),
                  Container(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      '${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')}-${_dateTime.year}',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // display DatePicker floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _showDatePicker,
        tooltip: 'Show DatePicker',
        child: Icon(Icons.date_range),
      ),
    );
  }


// bool defineSelectable(DateTime val) {
//     DateTime now = DateTime.now();
//     // disabled all days before today
//     if (val.isBefore(now)) {
//       return false;
//     }
//     // disabled all days except Sats
//     switch (val.weekday) {
//       case saturday:
//         return true;
//         break;
//       default:
//         return false;
//     }
//   }


  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('Done', style: TextStyle(color: Color(0xFF487890))),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _dateTime,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }
}