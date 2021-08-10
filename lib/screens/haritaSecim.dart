import 'package:flutter/material.dart';
import 'package:city_picker_from_map/city_picker_from_map.dart';
import 'package:district_picker_turkey_map/district_picker_turkey_map.dart'
    as province;

class haritaSecim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String adana = province.Maps.ADANA;
  String adiyaman = province.Maps.ADIYAMAN;
  String afyonkarahisar = province.Maps.AFYONKARAHISAR;
  String agri = province.Maps.AGRI;
  String amasya = province.Maps.AMASYA;
  String ankara = province.Maps.ANKARA;
  String antalya = province.Maps.ANTALYA;
  String artvin = province.Maps.ARTVIN;
  String aydin = province.Maps.AYDIN;
  String balikesir = province.Maps.BALIKESIR;
  String bilecik = province.Maps.BILECIK;
  String bingol = province.Maps.BINGOL;
  String bitlis = province.Maps.BITLIS;
  String bolu = province.Maps.BOLU;
  String burdur = province.Maps.BURDUR;
  String bursa = province.Maps.BURSA;
  String canakkale = province.Maps.CANAKKALE;
  String cankiri = province.Maps.CANKIRI;
  String corum = province.Maps.CORUM;
  String denizli = province.Maps.DENIZLI;
  String diyarbakir = province.Maps.DIYARBAKIR;
  String edirne = province.Maps.EDIRNE;
  String elazig = province.Maps.ELAZIG;
  String erzincan = province.Maps.ERZINCAN;
  String erzurum = province.Maps.ERZURUM;
  String eskisehir = province.Maps.ESKISEHIR;
  String gaziantep = province.Maps.GAZIANTEP;
  String giresun = province.Maps.GIRESUN;
  String gumushane = province.Maps.GUMUSHANE;
  String hakkari = province.Maps.HAKKARI;
  String hatay = province.Maps.HATAY;
  String isparta = province.Maps.ISPARTA;
  String mersin = province.Maps.MERSIN;
  String istanbul = province.Maps.ISTANBUL;
  String izmir = province.Maps.IZMIR;
  String kars = province.Maps.KARS;
  String kastamonu = province.Maps.KASTAMONU;
  String kayseri = province.Maps.KAYSERI;
  String kirklareli = province.Maps.KIRKLARELI;
  String kirsehir = province.Maps.KIRSEHIR;
  String kocaeli = province.Maps.KOCAELI;
  String konya = province.Maps.KONYA;
  String kutahya = province.Maps.KUTAHYA;
  String malatya = province.Maps.MALATYA;
  String manisa = province.Maps.MANISA;
  String kahramanmaras = province.Maps.KAHRAMANMARAS;
  String mardin = province.Maps.MARDIN;
  String mugla = province.Maps.MUGLA;
  String mus = province.Maps.MUS;
  String nevsehir = province.Maps.NEVSEHIR;
  String nigde = province.Maps.NIGDE;
  String ordu = province.Maps.ORDU;
  String rize = province.Maps.RIZE;
  String sakarya = province.Maps.SAKARYA;
  String samsun = province.Maps.SAMSUN;
  String siirt = province.Maps.SIIRT;
  String sinop = province.Maps.SINOP;
  String sivas = province.Maps.SIVAS;
  String tekirdag = province.Maps.TEKIRDAG;
  String tokat = province.Maps.TOKAT;
  String trabzon = province.Maps.TRABZON;
  String tunceli = province.Maps.TUNCELI;
  String sanliurfa = province.Maps.SANLIURFA;
  String usak = province.Maps.USAK;
  String van = province.Maps.VAN;
  String yozgat = province.Maps.YOZGAT;
  String zonguldak = province.Maps.ZONGULDAK;
  String aksaray = province.Maps.AKSARAY;
  String bayburt = province.Maps.BAYBURT;
  String karaman = province.Maps.KARAMAN;
  String kirikkale = province.Maps.KIRIKKALE;
  String batman = province.Maps.BATMAN;
  String sirnak = province.Maps.SIRNAK;
  String bartin = province.Maps.BARTIN;
  String ardahan = province.Maps.ARDAHAN;
  String igdir = province.Maps.IGDIR;
  String yalova = province.Maps.YALOVA;
  String karabuk = province.Maps.KARABUK;
  String kilis = province.Maps.KILIS;
  String osmaniye = province.Maps.OSMANIYE;
  String duzce = province.Maps.DUZCE;

  String citySelection = province.Maps.ANKARA;
  late City
      selectedCity; //city_picker_from_map paketinden City tipinde bir seçili şehir değişkeni tanımlıyoruz
  late province.District selectedDistrict;
  bool flag = true;
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();
  final GlobalKey<province.DistrictPickerMapState> _mapKeyCity = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Seçili şehir:  .... Seçili ilçe: }'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _mapKey.currentState
                    ?.clearSelect(); //appbar üzerindeki ikona basıldığında seçili şehri kaldırıyor
                _mapKeyCity.currentState?.clearSelect();
                setState(() {
                  selectedCity;
                  selectedDistrict;
                });
              }),
          IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.yellowAccent),
              onPressed: () {
                setState(() {
                  selectedCity;
                  selectedDistrict;
                  flag = !flag;
                });
              })
        ],
      ),
      body: Center(
        child: InteractiveViewer(
            scaleEnabled: true,
            panEnabled: true,
            constrained: true,
            child: AnimatedSwitcher(
              //animateswitcher ile iki widget arasında animasyonlu geçiş yapabiliyoruz
              duration: const Duration(seconds: 1),

              child: flag
                  ? CityPickerMap(
                      //city_picker_from_map paketi ile hangi haritayı seçeceğimizi ve görsel özelliklerini ayarlıyoruz
                      key: _mapKeyCity,
                      width: double.infinity,
                      height: double.infinity,
                      map: Maps.TURKEY,
                      onChanged: (city) {
                        setState(() {
                          selectedCity = city!;
                          if (selectedCity.title == "Adana")
                            citySelection = adana;
                          else if (selectedCity.title == "Adıyaman")
                            citySelection = adiyaman;
                          else if (selectedCity.title == "Afyonkarahisar")
                            citySelection = afyonkarahisar;
                          else if (selectedCity.title == "Ağrı")
                            citySelection = agri;
                          else if (selectedCity.title == "Amasya")
                            citySelection = amasya;
                          else if (selectedCity.title == "Ankara")
                            citySelection = ankara;
                          else if (selectedCity.title == "Antalya")
                            citySelection = antalya;
                          else if (selectedCity.title == "Artvin")
                            citySelection = artvin;
                          else if (selectedCity.title == "Aydın")
                            citySelection = aydin;
                          else if (selectedCity.title == "Balıkesir")
                            citySelection = balikesir;
                          else if (selectedCity.title == "Bilecik")
                            citySelection = bilecik;
                          else if (selectedCity.title == "Bingöl")
                            citySelection = bingol;
                          else if (selectedCity.title == "Bitlis")
                            citySelection = bitlis;
                          else if (selectedCity.title == "Bolu")
                            citySelection = bolu;
                          else if (selectedCity.title == "Burdur")
                            citySelection = burdur;
                          else if (selectedCity.title == "Bursa")
                            citySelection = bursa;
                          else if (selectedCity.title == "Çanakkale")
                            citySelection = canakkale;
                          else if (selectedCity.title == "Çankırı")
                            citySelection = cankiri;
                          else if (selectedCity.title == "Çorum")
                            citySelection = corum;
                          else if (selectedCity.title == "Denizli")
                            citySelection = denizli;
                          else if (selectedCity.title == "Diyarbakır")
                            citySelection = diyarbakir;
                          else if (selectedCity.title == "Edirne")
                            citySelection = edirne;
                          else if (selectedCity.title == "Elazığ")
                            citySelection = elazig;
                          else if (selectedCity.title == "Erzincan")
                            citySelection = erzincan;
                          else if (selectedCity.title == "Erzurum")
                            citySelection = erzurum;
                          else if (selectedCity.title == "Eskişehir")
                            citySelection = eskisehir;
                          else if (selectedCity.title == "Gaziantep")
                            citySelection = gaziantep;
                          else if (selectedCity.title == "Giresun")
                            citySelection = giresun;
                          else if (selectedCity.title == "Gümüşhane")
                            citySelection = gumushane;
                          else if (selectedCity.title == "Hakkari")
                            citySelection = hakkari;
                          else if (selectedCity.title == "Hatay")
                            citySelection = hatay;
                          else if (selectedCity.title == "Isparta")
                            citySelection = isparta;
                          else if (selectedCity.title == "Mersin")
                            citySelection = mersin;
                          else if (selectedCity.title == "İstanbul")
                            citySelection = istanbul;
                          else if (selectedCity.title == "İzmir")
                            citySelection = izmir;
                          else if (selectedCity.title == "Kars")
                            citySelection = kars;
                          else if (selectedCity.title == "Kastamonu")
                            citySelection = kastamonu;
                          else if (selectedCity.title == "Kayseri")
                            citySelection = kayseri;
                          else if (selectedCity.title == "Kırklareli")
                            citySelection = kirklareli;
                          else if (selectedCity.title == "Kırşehir")
                            citySelection = kirsehir;
                          else if (selectedCity.title == "Kocaeli")
                            citySelection = kocaeli;
                          else if (selectedCity.title == "Konya")
                            citySelection = konya;
                          else if (selectedCity.title == "Kütahya")
                            citySelection = kutahya;
                          else if (selectedCity.title == "Malatya")
                            citySelection = malatya;
                          else if (selectedCity.title == "Manisa")
                            citySelection = manisa;
                          else if (selectedCity.title == "Kahramanmaraş")
                            citySelection = kahramanmaras;
                          else if (selectedCity.title == "Mardin")
                            citySelection = mardin;
                          else if (selectedCity.title == "Muğla")
                            citySelection = mugla;
                          else if (selectedCity.title == "Muş")
                            citySelection = mus;
                          else if (selectedCity.title == "Nevşehir")
                            citySelection = nevsehir;
                          else if (selectedCity.title == "Niğde")
                            citySelection = nigde;
                          else if (selectedCity.title == "Ordu")
                            citySelection = ordu;
                          else if (selectedCity.title == "Rize")
                            citySelection = rize;
                          else if (selectedCity.title == "Sakarya")
                            citySelection = sakarya;
                          else if (selectedCity.title == "Samsun")
                            citySelection = samsun;
                          else if (selectedCity.title == "Siirt")
                            citySelection = siirt;
                          else if (selectedCity.title == "Sinop")
                            citySelection = sinop;
                          else if (selectedCity.title == "Sivas")
                            citySelection = sivas;
                          else if (selectedCity.title == "Tekirdağ")
                            citySelection = tekirdag;
                          else if (selectedCity.title == "Tokat")
                            citySelection = tokat;
                          else if (selectedCity.title == "Trabzon")
                            citySelection = trabzon;
                          else if (selectedCity.title == "Tunceli")
                            citySelection = tunceli;
                          else if (selectedCity.title == "Şanlıurfa")
                            citySelection = sanliurfa;
                          else if (selectedCity.title == "Uşak")
                            citySelection = usak;
                          else if (selectedCity.title == "Van")
                            citySelection = van;
                          else if (selectedCity.title == "Yozgat")
                            citySelection = yozgat;
                          else if (selectedCity.title == "Zonguldak")
                            citySelection = zonguldak;
                          else if (selectedCity.title == "Aksaray")
                            citySelection = aksaray;
                          else if (selectedCity.title == "Bayburt")
                            citySelection = bayburt;
                          else if (selectedCity.title == "Karaman")
                            citySelection = karaman;
                          else if (selectedCity.title == "Kırıkkale")
                            citySelection = kirikkale;
                          else if (selectedCity.title == "Batman")
                            citySelection = batman;
                          else if (selectedCity.title == "Şırnak")
                            citySelection = sirnak;
                          else if (selectedCity.title == "Bartın")
                            citySelection = bartin;
                          else if (selectedCity.title == "Ardahan")
                            citySelection = ardahan;
                          else if (selectedCity.title == "Iğdır")
                            citySelection = igdir;
                          else if (selectedCity.title == "Yalova")
                            citySelection = yalova;
                          else if (selectedCity.title == "Karabük")
                            citySelection = karabuk;
                          else if (selectedCity.title == "Kilis")
                            citySelection = kilis;
                          else if (selectedCity.title == "Osmaniye")
                            citySelection = osmaniye;
                          else if (selectedCity.title == "Düzce")
                            citySelection = duzce;

                          flag = !flag;
                        });
                      },
                      //actAsToggle: true,
                      dotColor: Colors.transparent,
                      selectedColor: Colors.yellowAccent,
                      strokeColor: Colors.white24,
                    )
                  : province.DistrictPickerMap(
                      key: _mapKey,
                      width: double.infinity,
                      height: double.infinity,
                      map: citySelection,
                      onChanged: (district) {
                        setState(() {
                          selectedDistrict = district!;
                        });
                      },
                      actAsToggle: true,
                      dotColor: Colors.white,
                      selectedColor: Colors.lightBlueAccent,
                      strokeColor: Colors.white24,
                    ),
            )),
      ),
    );
  }
}
