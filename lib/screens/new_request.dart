import 'package:flutter/material.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/screens/components/appbar_without_search.dart';

class NewRequest extends StatefulWidget {
  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  String dropdownValue = 'Select';

  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWithoutSearch(autoImplyLeading: true),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCategoryType(),
              buildActivityName(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Time & Date',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                            "${pickedDate.day} - ${pickedDate.month} - ${pickedDate.year}"),
                        trailing: Icon(Icons.arrow_downward),
                        onTap: () async {
                          DateTime date = await showDatePicker(
                            context: context,
                            initialDate: pickedDate,
                            firstDate: DateTime(DateTime.now().year),
                            lastDate: DateTime(DateTime.now().year + 2),
                          );

                          if (date != null) {
                            setState(() {
                              pickedDate = date;
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.access_time_rounded),
                        title: Text("${time.hour}:${time.minute}"),
                        trailing: Icon(Icons.arrow_downward),
                        onTap: () async {
                          TimeOfDay t = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );

                          if (t != null) {
                            setState(() {
                              time = t;
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              buildActivityDescription(),
              Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Request'),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container buildActivityDescription() {
    return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Activity Description',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextField(
                    maxLines: 11,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      hintText: "Please write the activity description.",
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            );
  }

  Container buildActivityName() {
    return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      'Activity Name',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Activity Name",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
  }

  Container buildCategoryType() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              'Category Type:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: DropdownButton(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              items: <String>['Select', 'Academics', 'Sports', 'Hackhatons']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
