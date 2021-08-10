import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../model/county.dart';
import '../model/city.dart';
import '../model/district.dart';
class Konum extends StatefulWidget {
  const Konum({ Key? key }) : super(key: key);

  @override
  _KonumState createState() => _KonumState();
}
class _KonumState extends State<Konum> {
  Future<List<City>> getCity() async{
    var jsonText=await rootBundle.loadString('assets/city.json');
    List jsonResponse=json.decode(jsonText);
    return jsonResponse.map((data) => new City.fromJson(data)).toList();
  }
  Future<List<County>> getCounty() async{
    var jsonText=await rootBundle.loadString('assets/county.json');
    return countyFromJson(jsonText,_selectedCity!);
  }
  Future<List<District>> getDistrict() async{
    var jsonText=await rootBundle.loadString('assets/mahalle-json/$_selectedCity.json');
    return districtFromJson(jsonText, _selectedCounty!);
  }
  late Future<List<City>> cityData;
  late Future<List<County>> countyData;
  late Future<List<District>> districtData;
  @override
  void initState(){
    super.initState();
    cityData=getCity();

  }
  String? _selectedCountry;
  List<City> dataCity=[];
  String? _selectedCounty;
  String? _selectedDistrict;
  String? _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType){
        return SafeArea(
          child: Scaffold(
              body:  Container(
                height: 100.h,
                color: Color(0XFFF6F0D2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: [
                        SizedBox(height:10),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){

                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                            Spacer(flex: 1,),
                            Text('Konum Bilginiz Yok',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            Spacer(flex: 2,)
                          ],
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: 50.w,
                          child: Text('Lütfen konumunuzu etkinleştirin ya da seçin',style:TextStyle(fontSize: 19),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height: 25,),
                        Image(image: AssetImage('assets/images/map1.png'),),
                        SizedBox(height: 25,),
                        Text('veya',style: TextStyle(fontSize: 19),),
                        SizedBox(height: 25,),
                        AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 700),
                          child: Container(
                              width: 70.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(250, 52, 63, 86)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 15,right: 15),
                                child: Center(
                                    child: DropdownButton<String>(
                                      style: TextStyle(color: Colors.white,fontSize: 17),
                                      underline: SizedBox(),
                                      hint: Center(child: Center(child: Text('Lütfen ülkenizi seçiniz',style: TextStyle(color: Colors.white))),),
                                      value: _selectedCountry!=null?_selectedCountry:null,
                                      iconEnabledColor: Colors.blue,
                                      menuMaxHeight: 40.h,
                                      isExpanded:true,
                                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                                      dropdownColor: Color.fromARGB(250, 52, 63, 86),
                                      onChanged: (String? newValue){
                                        setState(() {
                                          _selectedCountry=newValue!;
                                          _selectedCity=null;
                                          _selectedDistrict=null;
                                          _selectedCounty=null;
                                        });
                                      },
                                      items: <String>[
                                        'Türkiye'
                                      ].map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child:Center(child: Text(value),),
                                        );
                                      }).toList(),
                                    )
                                ),
                              )
                          ),
                        ),
                        SizedBox(height:20),
                        AnimatedOpacity(
                          opacity: _selectedCountry!=null? 1.0 : 0.0,
                          duration: Duration(milliseconds: 700),
                          child: Container(
                            child: _selectedCountry==null?SizedBox():FutureBuilder<List<City>>(
                                future: cityData,
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    dataCity=snapshot.data!;
                                    List<String> items=List<String>.generate(dataCity.length, (index) => dataCity[index].name);
                                    return Container(
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _selectedCountry==null?Colors.transparent:Color.fromARGB(250, 52, 63, 86)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15,right: 15),
                                          child: Center(
                                            child: DropdownButton<String>(
                                                dropdownColor: Color.fromARGB(250, 52, 63, 86),
                                                underline: SizedBox(),
                                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                                iconEnabledColor: Colors.blue,
                                                iconDisabledColor: Colors.transparent,
                                                autofocus: true,
                                                style: TextStyle(color: Colors.white,fontSize: 17),
                                                hint: Center(child: Text('Lütfen şehrinizi seçiniz',style: TextStyle(color: Colors.white)),),
                                                value: _selectedCity!=null?_selectedCity:null,
                                                isExpanded:true,
                                                onChanged: _selectedCountry==null?null:(String? newValue){
                                                  setState(() {
                                                    _selectedCity=newValue!;
                                                    countyData=getCounty();
                                                    _selectedCounty=null;
                                                    _selectedDistrict=null;
                                                  });
                                                },
                                                items:items.map<DropdownMenuItem<String>>((String value){
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Center(child: Text(value),),
                                                  );
                                                }).toList()
                                            ),
                                          ),
                                        )
                                    );
                                  }else{
                                    return Platform.isAndroid?CircularProgressIndicator():CupertinoActivityIndicator();
                                  }
                                }
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        AnimatedOpacity(
                          opacity: _selectedCity!=null? 1.0:0.0,
                          duration: Duration(milliseconds: 700),
                          child: Container(
                            child:_selectedCity==null?SizedBox(): FutureBuilder<List<County>>(
                                future: countyData,
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    List<County> data=snapshot.data!;
                                    List<String> items=List<String>.generate(data.length, (index) => data[index].name);
                                    return Container(
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _selectedCity==null?Colors.transparent:Color.fromARGB(250, 52, 63, 86)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15,right: 15),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              dropdownColor: Color.fromARGB(250, 52, 63, 86),
                                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                                              underline: SizedBox(),
                                              iconEnabledColor: Colors.blue,
                                              iconDisabledColor: Colors.transparent,
                                              isExpanded: true,
                                              style: TextStyle(color: Colors.white,fontSize: 17),
                                              hint: Center(child: Text('Lütfen ilçenizi seçiniz',style: TextStyle(color: Colors.white),),),
                                              value: _selectedCity!=null?_selectedCounty:null,
                                              onChanged: _selectedCity==null?null:(String? newValue){
                                                setState(() {
                                                  _selectedCounty=newValue!;
                                                  districtData=getDistrict();
                                                  _selectedDistrict=null;
                                                });
                                              },
                                              items:items.map<DropdownMenuItem<String>>((String value){
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Center(child: Text(value),),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        )
                                    );
                                  }else{
                                    return SizedBox();
                                  }
                                }
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        AnimatedOpacity(
                          opacity: _selectedCounty!=null? 1.0 : 0.0,
                          duration: Duration(milliseconds: 700),
                          child:Container(
                            child: _selectedCounty==null?SizedBox():FutureBuilder<List<District>>(
                                future: districtData,
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    List<District> data=snapshot.data!;
                                    List<String> items=List<String>.generate(data.length, (index) => data[index].mahalle);
                                    return Container(
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _selectedCounty==null?Colors.transparent:Color.fromARGB(250, 52, 63, 86)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15,right: 15),
                                          child: Center(
                                            child: DropdownButton<String>(
                                              dropdownColor: Color.fromARGB(250, 52, 63, 86),
                                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                                              underline: SizedBox(),
                                              iconEnabledColor: Colors.blue,
                                              iconDisabledColor: Colors.transparent,
                                              isExpanded: true,
                                              style: TextStyle(color: Colors.white,fontSize: 17),
                                              hint: Center(child: Text('Lütfen mahallenizi seçiniz',style: TextStyle(fontSize: 16,color: Colors.white),),),
                                              value: _selectedCounty!=null?_selectedDistrict:null,
                                              onChanged: _selectedCounty==null?null:(String? newValue){
                                                setState(() {
                                                  _selectedDistrict=newValue!;
                                                });
                                              },
                                              items:items.map<DropdownMenuItem<String>>((String value){
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Center(child: Text(value,textAlign: TextAlign.center,),),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        )
                                    );
                                  }else{
                                    return Platform.isAndroid? CircularProgressIndicator():CupertinoActivityIndicator();
                                  }
                                }
                            ),
                          ),
                        ),
                        SizedBox(height:20),
                        AnimatedOpacity(
                          opacity: _selectedDistrict==null?0:1,
                          duration: Duration(milliseconds: 700),
                          child: ElevatedButton(
                            onPressed: _selectedDistrict==null?null:(){
                              print('Country: $_selectedCountry, City: $_selectedCity, County: $_selectedCounty, District: $_selectedDistrict');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(250, 52, 63, 86),
                            ),
                            child: Container(width: 40.w,child: Center(child: Text('Giriş Yap',style: TextStyle(fontSize: 17),),),),
                          ),
                        ),
                        SizedBox(height:20),
                      ]
                  ),
                ),
              )
          ),
        );
      },
    );
  }
}