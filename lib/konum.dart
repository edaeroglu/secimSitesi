import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:city_picker_from_map/city_picker_from_map.dart' as C;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/County.dart';
import 'model/city.dart';
import 'model/city.dart' as B;
import 'model/district.dart';
import 'package:sizer/sizer.dart';
import 'package:district_picker_turkey_map/district_picker_turkey_map.dart' as province;


String adana=province.Maps.ADANA;
String adiyaman=province.Maps.ADIYAMAN;
String afyonkarahisar=province.Maps.AFYONKARAHISAR;
String agri=province.Maps.AGRI;
String amasya=province.Maps.AMASYA;
String ankara=province.Maps.ANKARA;
String antalya=province.Maps.ANTALYA;
String artvin=province.Maps.ARTVIN;
String aydin=province.Maps.AYDIN;
String balikesir=province.Maps.BALIKESIR;
String bilecik=province.Maps.BILECIK;
String bingol=province.Maps.BINGOL;
String bitlis=province.Maps.BITLIS;
String bolu=province.Maps.BOLU;
String burdur=province.Maps.BURDUR;
String bursa=province.Maps.BURSA;
String canakkale=province.Maps.CANAKKALE;
String cankiri=province.Maps.CANKIRI;
String corum=province.Maps.CORUM;
String denizli=province.Maps.DENIZLI;
String diyarbakir=province.Maps.DIYARBAKIR;
String edirne=province.Maps.EDIRNE;
String elazig=province.Maps.ELAZIG;
String erzincan=province.Maps.ERZINCAN;
String erzurum=province.Maps.ERZURUM;
String eskisehir=province.Maps.ESKISEHIR;
String gaziantep=province.Maps.GAZIANTEP;
String giresun=province.Maps.GIRESUN;
String gumushane=province.Maps.GUMUSHANE;
String hakkari=province.Maps.HAKKARI;
String hatay=province.Maps.HATAY;
String isparta=province.Maps.ISPARTA;
String mersin=province.Maps.MERSIN;
String istanbul=province.Maps.ISTANBUL;
String izmir=province.Maps.IZMIR;
String kars=province.Maps.KARS;
String kastamonu=province.Maps.KASTAMONU;
String kayseri=province.Maps.KAYSERI;
String kirklareli=province.Maps.KIRKLARELI;
String kirsehir=province.Maps.KIRSEHIR;
String kocaeli=province.Maps.KOCAELI;
String konya=province.Maps.KONYA;
String kutahya=province.Maps.KUTAHYA;
String malatya=province.Maps.MALATYA;
String manisa=province.Maps.MANISA;
String kahramanmaras=province.Maps.KAHRAMANMARAS;
String mardin=province.Maps.MARDIN;
String mugla=province.Maps.MUGLA;
String mus=province.Maps.MUS;
String nevsehir=province.Maps.NEVSEHIR;
String nigde=province.Maps.NIGDE;
String ordu=province.Maps.ORDU;
String rize=province.Maps.RIZE;
String sakarya=province.Maps.SAKARYA;
String samsun=province.Maps.SAMSUN;
String siirt=province.Maps.SIIRT;
String sinop=province.Maps.SINOP;
String sivas=province.Maps.SIVAS;
String tekirdag=province.Maps.TEKIRDAG;
String tokat=province.Maps.TOKAT;
String trabzon=province.Maps.TRABZON;
String tunceli=province.Maps.TUNCELI;
String sanliurfa=province.Maps.SANLIURFA;
String usak=province.Maps.USAK;
String van=province.Maps.VAN;
String yozgat=province.Maps.YOZGAT;
String zonguldak=province.Maps.ZONGULDAK;
String aksaray=province.Maps.AKSARAY;
String bayburt=province.Maps.BAYBURT;
String karaman=province.Maps.KARAMAN;
String kirikkale=province.Maps.KIRIKKALE;
String batman=province.Maps.BATMAN;
String sirnak=province.Maps.SIRNAK;
String bartin=province.Maps.BARTIN;
String ardahan=province.Maps.ARDAHAN;
String igdir=province.Maps.IGDIR;
String yalova=province.Maps.YALOVA;
String karabuk=province.Maps.KARABUK;
String kilis=province.Maps.KILIS;
String osmaniye=province.Maps.OSMANIYE;
String duzce=province.Maps.DUZCE;

String citySelection=province.Maps.ANKARA;
City selectedCity;                                                             //city_picker_from_map paketinden City tipinde bir seçili şehir değişkeni tanımlıyoruz
province.District selectedDistrict;
bool flag =true;
final GlobalKey<C.CityPickerMapState> _mapKey = GlobalKey();
final GlobalKey<province.DistrictPickerMapState> _mapKeyCity = GlobalKey();

class Konum extends StatefulWidget {
  const Konum({   Key key }) : super(key: key);

  @override
  _KonumState createState() => _KonumState();
}
class _KonumState extends State<Konum> {
  Future<List<B.City>> getCity() async{
    var jsonText=await rootBundle.loadString('assets/City.json');
    List jsonResponse=json.decode(jsonText);
    return jsonResponse.map((data) => new B.City.fromJson(data)).toList();
  }
  Future<List<County>> getCounty() async{
    var jsonText=await rootBundle.loadString('assets/county.json');
    return countyFromJson(jsonText,_selectedCity);
  }
  Future<List<District>> getDistrict() async{
    var jsonText=await rootBundle.loadString('assets/mahalle-json/$_selectedCity.json');
    return districtFromJson(jsonText, _selectedCounty);
  }
     Future<List<B.City>> cityData;
     Future<List<County>> countyData;
     Future<List<District>> districtData;
  @override
  void initState(){
    super.initState();
    cityData=getCity();

  }
    String _selectedCountry;
  List<B.City> dataCity=[];
    String _selectedCounty;
   String _selectedDistrict;
    String _selectedCity;
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
                        SizedBox(height: 25),



                        Image(image: AssetImage('assets/images/map1.png'),),


                        SizedBox(height: 25),
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
                                      onChanged: (String newValue) async => setState(() {
                                          _selectedCountry=newValue;
                                          _selectedCity= null;
                                          _selectedDistrict= null;
                                          _selectedCounty= null;
                                        }),
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
                            child: _selectedCountry==null?SizedBox():FutureBuilder<List<B.City>>(
                                future: cityData,
                                builder: (context,snapshot){
                                  if(snapshot.hasData){
                                    dataCity=snapshot.data;
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
                                                onChanged: _selectedCountry==null?null:(String newValue){
                                                  setState(() {
                                                    _selectedCity=newValue;
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
                                    List<County> data=snapshot.data;
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
                                              onChanged: _selectedCity==null?null:(String newValue){
                                                setState(() {
                                                  _selectedCounty=newValue;
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
                                    List<District> data=snapshot.data;
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
                                              onChanged: _selectedCounty==null?null:(String newValue){
                                                setState(() {
                                                  _selectedDistrict=newValue;
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
                      ],


                  ),
                ),
              )
          ),
        );
      },
    );
  }
}
