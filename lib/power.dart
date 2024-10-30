import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/history.dart';

class power extends StatefulWidget {
  List items;
  power({super.key,required this.items});

  @override
  State<power> createState() => _powerState();
}

class _powerState extends State<power> {
  String? selectedValue;
  String? _selectedValue;
  Color backcolor= Color(0xff121212); //Color(0xff121212);  
  TextEditingController num=TextEditingController();
  double? result;

void convertPower() {
  double value = double.parse(num.text);
  if (selectedValue == 'Watt' && _selectedValue == 'Kilowatt') {
    result = value / 1000;
  } else if (selectedValue == 'Watt' && _selectedValue == 'Megawatt') {
    result = value / 1e6;
  } else if (selectedValue == 'Watt' && _selectedValue == 'Horsepower') {
    result = value / 745.7;
  } else if (selectedValue == 'Kilowatt' && _selectedValue == 'Watt') {
    result = value * 1000;
  } else if (selectedValue == 'Kilowatt' && _selectedValue == 'Megawatt') {
    result = value / 1000;
  } else if (selectedValue == 'Kilowatt' && _selectedValue == 'Horsepower') {
    result = value * 1.34102;
  } else if (selectedValue == 'Megawatt' && _selectedValue == 'Watt') {
    result = value * 1e6;
  } else if (selectedValue == 'Megawatt' && _selectedValue == 'Kilowatt') {
    result = value * 1000;
  } else if (selectedValue == 'Megawatt' && _selectedValue == 'Horsepower') {
    result = value * 1341.02;
  } else if (selectedValue == 'Horsepower' && _selectedValue == 'Watt') {
    result = value * 745.7;
  } else if (selectedValue == 'Horsepower' && _selectedValue == 'Kilowatt') {
    result = value / 1.34102;
  } else if (selectedValue == 'Horsepower' && _selectedValue == 'Megawatt') {
    result = value / 1341.02;
  }
  setState(() {
    // Update the result in the UI
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backcolor,
      appBar: AppBar(
        backgroundColor: backcolor,
        title: Text("power",style: TextStyle(color: Color.fromRGBO(112, 103, 220, 1)),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,) ,),
      ),
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
             Row(
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('From:',style: TextStyle(color: Colors.white),),
                    Container(
                      // padding: EdgeInsets.only(right: 10,left: 10),
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      child:  DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(

                            isExpanded: true,
                            hint: Text(
                              'Select Unit',
                              style: TextStyle(color: Colors.white),
                            ),
                            items: ['Megawatt','Kilowatt','Horsepower','Watt']
                                .map((String value) {
                              return DropdownMenuItem<String>(

                                value: value,
                                child: Text(value , style: TextStyle(color: Colors.white),),
                              );
                            }).toList(),
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              // Handle change
                              setState(() {
                                selectedValue = newValue!;
                                
                              });
                            },
                          dropdownStyleData: DropdownStyleData(decoration:BoxDecoration(color:backcolor )),
                          ),
                      ),
                    )
                  ],
                 ),
                 SizedBox(width:25 ,),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('To:',style: TextStyle(color: Colors.white),),
                    Container(
                       padding: EdgeInsets.only(right: 10,left: 10),
                      alignment: AlignmentDirectional.bottomStart,
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      child:   DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Unit',
                              style: TextStyle(color: Colors.white),
                            ),
                            items: ['Megawatt','Kilowatt','Horsepower','Watt']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            value: _selectedValue,
                            onChanged: (String? newValue) {
                              // Handle change
                              setState(() {
                                _selectedValue = newValue!;
                                
                              });
                            },
                             dropdownStyleData: DropdownStyleData(decoration:BoxDecoration(color:backcolor )),
                          ),
                      ),
                    )
                  ],
                 )
            ],),
            SizedBox(height: 20,),
            Row(
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Input data',style: TextStyle(color: Colors.white),),
                    Container(
                      padding: EdgeInsets.only(right: 10,left: 10),
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      child:  TextFormField(
                        keyboardType: TextInputType.number,
                      
                        
                        controller: num,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(hintText: 'e.g 1000', border: InputBorder.none,hintStyle: TextStyle(color: Colors.white)),
                      )
                    )
                  ],
                 ),
                 SizedBox(width:25 ,),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Result:',style: TextStyle(color: Colors.white),),
                    Container(
                       padding: EdgeInsets.only(right: 10,left: 10),
                      alignment: AlignmentDirectional.bottomStart,
                      height: 35,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      child:  Text('${result}',style: TextStyle(color: Colors.white),)
                    )
                  ],
                 )
            ],),
            SizedBox(height:70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                   convertPower();
                    data Calculate=data(unitfrom: selectedValue!, unitto: _selectedValue!, value: num.text, result: result.toString());
                   widget.items.add(Calculate);

                  },
                  
                  child: Container(padding: EdgeInsets.only(right: 50,left: 50,top: 10,bottom: 10),alignment: Alignment.center,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color.fromRGBO(112, 103, 220, 1)),child: Text('Calculate',style: TextStyle(fontSize: 20,color:Colors.white ),),)),
              ],
            )
        ],),
      ),
    );
  }
}