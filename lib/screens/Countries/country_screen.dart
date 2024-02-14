 
 import 'package:flutter/material.dart';
import 'package:flutter_technical_test/modeles/country.dart';


class CountryScreen extends StatelessWidget {
  final Country country;

  CountryScreen({required this.country});
   @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.36;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         // Background color
  centerTitle: true,
        title:  Text(
            "${country.name} ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              
              color: Colors.white, // Adjust the text color as needed
            ),
          ),
      ),
     
      body:Container(
        margin: const EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                        
                   
              
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  
 Container(
                          width: MediaQuery.of(context).size.width,
                          height: (MediaQuery.of(context).size.height) / 2,
                            decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(country.flagUrl),
                                          ),
                                        ),
                          
                        ),
                  
                   Container(
                     margin: const EdgeInsets.only(top: 20,),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Card(
                            
                                  elevation: 4, // Adjust the elevation as needed
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
    side: BorderSide(
      color: Colors.grey[400]!, // Adjust the border color as needed
      width: 1, // Adjust the border width as needed
    ),
  ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all( 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(children: [
                                      Container(
                                        width: width,
                                        child: Text(
                                          'Capital ',
                                        
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.red,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Flexible(
                                          child: Text(
                                        "${country.capital} ",
                                        
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Montserrat-Bold",
                                            fontSize: 13),
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                    ]),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                        width: width,
                                        child: Text('Population: ',
                                           
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.red,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                      Flexible(
                                          child: Text(
                                              "${country.population}",
                                             
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat-Bold",
                                                  fontSize: 13)))
                                    ]),
                                    SizedBox(height: 10),
                                    Row(children: [
                                      Container(
                                        width: width,
                                        child: Text(
                                          'Surface: ',
                                         
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.red,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Flexible(
                                          child: Text(
                                              "${country.area}",
                                             
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat-Bold",
                                                  fontSize: 13),
                                              overflow: TextOverflow.ellipsis))
                                    ]),
                                  
                                  
                    
                                
                                   
                                  ]),
                            ))
                      ],
                    ),
                  )),
              
              
              
                        
                        
                  
                  ]),
          
              
                        
                        
                       
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                 ),
            
             
        
      
    
    );
  }
}