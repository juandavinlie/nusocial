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
              Container(
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
              ),
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
                        title: Text(
                            "Date: ${pickedDate.day} - ${pickedDate.month} - ${pickedDate.year}"),
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
                        title: Text("Time: ${time.hour}:${time.minute}"),
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
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                        hintText: "Please write the activity description.",
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                    ),
                  ],
                ),
              ),
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
