import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller1 = TextEditingController();
  //textfild
  String _text;
  //Checkbook
  List<Food> foods = Food.getFood();
  List<String> _foodChecked = [];
  //Radio
  String _gender;
  //DropdoenButton
  List<String> dropdownltems = ['นาย','นาง','นางสาว','เด็กชาย','เด็กหญิง'];
  String _selectedltem = 'นาย';
   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('Text Form Field Example'),
       ),
       body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      //not show ??
                      if (value.isEmpty) {
                        return 'Enter some text';
                        //not show ??

                      } else {
                        _text = value;
                      }
                      return null;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_comment),
                    labelText: "Enter text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _controller1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter some text';
                  }
                  return value;
                },
              ),
            ),
            Divider(),
            CheckboxListTile(
                title: Text(foods[0].foodName),
                value: foods[0].isChecked,
                onChanged: (bool value) {
                  setState(() {
                    foods[0].isChecked = value;
                  });
                  if (value) {
                    _foodChecked.add(foods[0].foodName);
                  } else {
                    _foodChecked.remove(foods[0].foodName);
                  }
                }),
            
              CheckboxListTile(
                title: Text(foods[1].foodName),
                value: foods[1].isChecked,
                onChanged: (bool value){
                  setState(() {
                    foods[1].isChecked = value;
                });
                if(value){
                  _foodChecked.add(foods[1].foodName);
                } else{
                  _foodChecked.remove(foods[1].foodName);
                }
              }),
               RadioListTile(
                title: Text("เพศชาย"),
                value: "mele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            RadioListTile(
                title: Text("เพศหญิง"),
                value: "femele",
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
            DropdownButton(
              value: _selectedltem,
              items: dropdownltems.map<DropdownMenuItem<String>>((val) {
                return DropdownMenuItem<String>(
                  child: Text(val),
                  value: val,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedltem = value;
                });
              },
            ),

              
              RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                // text form fild error ??
                if (_formKey.currentState.validate()) {
                  print(_controller1.text);
                }
                // text form fild error ??

                print(_text);
                print(_foodChecked);
                print(_gender);
                print( _selectedltem);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Food{
  String foodName;
  bool isChecked;

  Food(this.foodName, this.isChecked);

  static List<Food> getFood(){
    return <Food>[
      Food('food1', false),
      Food('food2', false)
    ];
  }
}