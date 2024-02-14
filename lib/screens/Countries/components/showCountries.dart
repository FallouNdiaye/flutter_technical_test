import 'package:flutter/material.dart';
import 'package:flutter_technical_test/modeles/country.dart';
import 'package:flutter_technical_test/screens/Countries/country_screen.dart';

class ShowCountries extends StatelessWidget {
  final List<Country> countries;
 
  const ShowCountries({
    Key? key,
    required this.countries,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: countries.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(0.0),
            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.all(0.0),
              title: Text('${countries[index].name}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Capitale: ${countries[index].capital} '),
                    Text('Population: ${countries[index].population}')
                  ]),
              leading: Stack(children: [
                CircleAvatar(
                    radius: 40,
                    backgroundImage:
                         NetworkImage(countries[index].flagUrl),
                         
                         ),
              ]),
             
              onTap: () {
                Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => CountryScreen(
                                                  country: countries[index],
                                                ),
                                              ),
                                            );
              },
            )),
          ),
        ));
  }
}
