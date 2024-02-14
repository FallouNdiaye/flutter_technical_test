import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_technical_test/modeles/country.dart';
import 'package:flutter_technical_test/screens/Components/async_value.dart';
import 'package:flutter_technical_test/screens/Components/lottie.dart';
import 'package:flutter_technical_test/screens/Components/resources.dart';

import 'package:flutter_technical_test/screens/Countries/components/search_field.dart';
import 'package:flutter_technical_test/screens/Countries/components/showCountries.dart';


class SearchCountryScreen extends StatefulWidget {
  final List<Country> countries;
  SearchCountryScreen({Key? key, required this.countries}) : super(key: key);
  SearchCountryScreenState createState() => SearchCountryScreenState();
}

class SearchCountryScreenState extends State<SearchCountryScreen> {
  List<Country> countrySearch = [];
  var nameRecherch = '';
  var asyncValue;
  List<Country> countries  = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF111111),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: SearchField(
                          hintText: 'Rechercher',
                          autofocus: true,
                          onChanged: (value) {
                            print('ici onTap');
                            print(value);
                            if (value.isNotEmpty) {
                              setState(() {
                                nameRecherch = value;
                                countrySearch = searchCountries(value);
                                asyncValue =
                                    AsyncValue.data(searchCountries(value));
                              });
                            }
                          })),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              countrySearch.isNotEmpty
                  ? Text(
                      'Resultats sur "$nameRecherch "',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111111),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),

              countrySearch.isEmpty
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container()
                   
                    )
                
                  : AsyncValueWidget<List<Country>?>(
                      value: asyncValue,
                      data: (value) {
                        if (value == null) {
                          return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                               Container()
                            //  ListTileShimmer()
                                ]);
                        

                        
                        }
                        if (value.isEmpty) {
                          return 
                          Text(
                      'Aucun Resultat trouvé sur "$nameRecherch "',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111111),
                      ),
                    );
                          
                        }
                        return ShowCountries(countries: value);
                        
                       
                      },
                    )

             
            ],
          ),
        ),
      ),
    );
  }



  List<Country> searchCountries(String query) {
     
    List<Country> results = [];



    for (Country country in widget.countries) {
      if (country.name.toLowerCase().contains(query.toLowerCase())) {
        results.add(country);
      }
    }
    return results;
  }
}
