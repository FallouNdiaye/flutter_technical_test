
import 'package:flutter_technical_test/modeles/country.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:connectivity_plus/connectivity_plus.dart';

class BackendService {
 

  static getCountries() async {
   
    List<Country> data = [];
     final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String cachedData = prefs.getString('cachedCountries') ?? '';
   

   var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

           try {
      final res =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

      if (res.statusCode == 200) {
        var body = convert.json.decode((res.body));
       
     
        for (var item in body) {
         // print(item['name']['common']);
          
         data.add(Country(name:item['name']['common']!=null?item['name']['common']:'', 
        capital:item['capital']!=null?item['capital'][0]:'N/A',
         population:item['population']!=null?item['population']:0,
         area:item['area']!=null?item['area']:0,
         flagUrl:item['flags']['png']!=null?item['flags']['png']:''));
       
        }
        
        prefs.setString('cachedCountries', convert.json.encode(data));
 
        return data;
      } else {
        return -1;
      }
    } catch (error) {
      
      return -1;
    }
        }
        else{
         
         if (cachedData.isNotEmpty) {
    
    final List<dynamic> cachedJson = convert.json.decode(cachedData);
    return cachedJson.map((json) => Country.fromJson(json)).toList();
  }
        }
   
  }
  
  

 
  

 
}
  