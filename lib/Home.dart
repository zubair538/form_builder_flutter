import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_data_sending/InputFeild.dart';

import 'second_activity.dart';
import 'user_model.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Builder'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      child: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                    attribute: 'first_name',
                    decoration: InputStyle('Frist Name',
                        hint: "Frist Name"
                            ""),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Frist Name is Requrid')
                    ]),
                SizedBox(
                  height: 20,
                ),
                FormBuilderTextField(
                  attribute: 'email',
                  decoration: InputStyle("Email", hint: "Enter Your Email"),
                  validators: [
                    FormBuilderValidators.required(
                        errorText: 'Entery your Email'),
                    FormBuilderValidators.email()
                  ],
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderCheckbox(
                  attribute: 'accept_terms',
                  label:
                      Text("I have read and agree to the terms and conditions"),
                  decoration: InputStyle("checkbox"),
                  validators: [
                    FormBuilderValidators.requiredTrue(
                      errorText:
                          "You must accept terms and conditions to continue",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderCheckboxList(
                  decoration: InputStyle(
                    'CheckBox List',
                  ),
                  attribute: 'language',
                  initialValue: ['Dart'],
                  options: [
                    FormBuilderFieldOption(value: "Dart"),
                    FormBuilderFieldOption(value: "Kotlin"),
                    FormBuilderFieldOption(value: "Java"),
                    FormBuilderFieldOption(value: "Swift"),
                    FormBuilderFieldOption(value: "Objective-C"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderRate(
                  decoration: InputStyle("Rate this form"),
                  attribute: "rate",
                  iconSize: 32.0,
                  initialValue: 1,
                  max: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderChoiceChip(
                  attribute: "choice",
                  options: [
                    FormBuilderFieldOption(
                        child: Text("Vanilla"), value: "vanilla"),
                    FormBuilderFieldOption(
                        child: Text("Chocolate"), value: "chocolate"),
                    FormBuilderFieldOption(
                        child: Text("Strawberry"), value: "strawberry"),
                    FormBuilderFieldOption(
                        child: Text("Peach"), value: "peach"),
                  ],
                  decoration: InputStyle('Choice Chip'),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderFilterChip(
                  attribute: "filter",
                  options: [
                    FormBuilderFieldOption(child: Text("Cats"), value: "cats"),
                    FormBuilderFieldOption(child: Text("Dogs"), value: "dogs"),
                    FormBuilderFieldOption(
                        child: Text("Rodents"), value: "rodents"),
                    FormBuilderFieldOption(
                        child: Text("Birds"), value: "birds"),
                  ],
                  decoration: InputStyle('Filter Chip'),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderSignaturePad(
                  attribute: 'signature',
                  decoration: InputStyle("Signature"),
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderStepper(
                  decoration: InputStyle("Stepper"),
                  initialValue: 10,
                  step: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderSwitch(
                  label: Text('I Accept the tems and conditions'),
                  attribute: "accept_terms_switch",
                  initialValue: true,
                  decoration: InputStyle('Switch Button'),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderSegmentedControl(
                  decoration: InputStyle("Movie Rating (Archer)"),
                  attribute: "movie_rating",
                  options: List.generate(5, (i) => i + 1)
                      .map((number) => FormBuilderFieldOption(value: number))
                      .toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderDropdown(
                  attribute: "gender",
                  decoration: InputStyle("Gender"),
                  // initialValue: 'Male',
                  hint: Text('Select Gender'),
                  validators: [FormBuilderValidators.required()],
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                          value: gender, child: Text("$gender")))
                      .toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderSlider(
                  attribute: "slider",
                  validators: [FormBuilderValidators.min(6)],
                  min: 0.0,
                  max: 10.0,
                  initialValue: 1.0,
                  divisions: 10,
                  decoration: InputStyle("Number of things"),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderDateTimePicker(
                  attribute: "date",
                  inputType: InputType.time,
                  decoration:
                      InputStyle("Time Picker", hint: 'Appointment Time'),
                ),
                SizedBox(
                  height: 20,
                ),
                FormBuilderDateTimePicker(
                  attribute: "date",
                  inputType: InputType.date,

                    firstDate: new DateTime(2015),
                    lastDate: new DateTime(2020),
                  decoration:
                      InputStyle("date Picker", hint: 'Appointment Date'),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_fbKey.currentState.saveAndValidate()) ;
                    {

                      User user = User(
                          _fbKey.currentState.value['first_name'].toString(),
                          _fbKey.currentState.value['email'].toString(),
                          _fbKey.currentState.value['accept_terms'].toString(),
                          _fbKey.currentState.value['language'].toString(),
                          _fbKey.currentState.value['rate'].toString(),
                          _fbKey.currentState.value['choice'].toString(),
                          _fbKey.currentState.value['filter'].toString(),
                          _fbKey.currentState.value['signature'].toString(),
                      );

                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondActivity(user)),);
                    }

                  },
                  child: Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
