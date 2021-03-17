import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nusocial/constants.dart';
import 'package:nusocial/screens/components/appbar_without_search.dart';
import 'package:nusocial/services/database.dart';
import 'package:uuid/uuid.dart';

class NewRequest extends StatefulWidget {
  String uid;
  NewRequest({this.uid});

  @override
  _NewRequestState createState() => _NewRequestState();
}

class _NewRequestState extends State<NewRequest> {
  String dropdownValue = 'Select';
  String eventName = "";
  DateTime pickedDate;
  TimeOfDay time;
  String eventDescription = "";
  int maxNoOfParticipants;
  String error = "";

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
        child: AppBarWithoutSearch(
          autoImplyLeading: true,
          text1: 'NUS',
          text2: 'ocial',
        ),
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
                            setState(
                              () {
                                pickedDate = date;
                              },
                            );
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
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Text(
                        'Max Number of Participants',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          fillColor: Colors.white,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          maxNoOfParticipants = int.parse(val);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              buildActivityDescription(),
              Center(child: Container(child: Text(error, style: TextStyle(color: Colors.red),))),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  clipBehavior: Clip.none,
                  autofocus: false,
                  child: Text('Create'),
                  onPressed: () async {
                    if (dropdownValue != 'Select' && eventName.length > 0 && eventDescription.length > 0 && maxNoOfParticipants > 1) {
                      int millisecondsSinceEpoch = DateTime(
                              pickedDate.year,
                              pickedDate.month,
                              pickedDate.day,
                              time.hour,
                              time.minute)
                          .millisecondsSinceEpoch;
                      String eventId = Uuid().v4();
                      await DatabaseService().updateRequest(
                          eventId,
                          dropdownValue,
                          eventName,
                          millisecondsSinceEpoch,
                          eventDescription,
                          maxNoOfParticipants,
                          widget.uid);
                      print("User " + widget.uid);
                      await DatabaseService(uid: widget.uid).joinEvent(eventId);
                      await DatabaseService()
                          .addOneToRegister(dropdownValue, eventId);
                      Navigator.pushReplacementNamed(context, '/');
                    } else {
                      setState(() {
                        error = "Fields cannot be empty and Max Number of Participants must be greater than 1";
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildActivityDescription() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Event Description',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextField(
            maxLines: 11,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: "Please write the event description.",
            ),
            autofocus: false,
            onChanged: (val) {
              eventDescription = val;
            },
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
              'Event Name',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Event Name",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
              fillColor: Colors.white,
            ),
            onChanged: (val) {
              eventName = val;
            },
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
              items: <String>[
                'Select',
                'Academics',
                'Activities',
                'Gaming',
                'Hackathons',
                'Others'
              ].map<DropdownMenuItem<String>>((String value) {
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
