import 'package:flutter/material.dart';
import 'package:flutter_technical_test/modeles/country.dart';
import 'package:flutter_technical_test/screens/Countries/components/alertError.dart';
import 'package:flutter_technical_test/screens/Countries/components/placeholder_search_field.dart';
import 'package:flutter_technical_test/screens/Countries/components/showCountries.dart';
import 'package:flutter_technical_test/services/backend_service.dart';


class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<CountriesScreen> {
List<Country> countries = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }
getCountries() async {
    // _showProgresss() ;
    BackendService.getCountries().then((value) {
        if (value == -1) {
          Navigator.pop(context);
          showApiErrorDialog( context,'Votre api a un probleme');
        } else {
           
          if (mounted) {

            setState(() {
             countries  = value;
              
            });
          }
        }
      });
}

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         // Background color
  centerTitle: true,
        title:  Text(
            "Les pays du monde",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              
              color: Colors.white, // Adjust the text color as needed
            ),
          ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              PlaceholderSearchField(
                placeholderText: 'Rechercher',
                countries: countries,
              ),
              SizedBox(height: 40),
             
             
              countries.length!=0?ShowCountries(countries: countries):_showProgresss()
            ],
          ),
        ),
      ),
    );
  }


Widget _showProgresss(){
  return Container(
        padding: const EdgeInsets.all(20),
            
            width: MediaQuery.of(context).size.width,
            child: Center(child:Row(children: [
        CircularProgressIndicator(
          backgroundColor: Colors.blue,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.yellow, //<-- SEE HERE
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 10),
            child: Text("Chargement...",
                style: TextStyle(
                    fontSize: 12,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat-Bold',
                    color: Colors.blue),
                maxLines: 2,
                textAlign: TextAlign.center)),
      ])));
    
}

    

    
  

}







