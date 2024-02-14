import 'package:flutter/material.dart';
import 'package:flutter_technical_test/modeles/country.dart';
import 'package:flutter_technical_test/screens/Countries/search_country_screen.dart';


class PlaceholderSearchField extends StatelessWidget {
  final String placeholderText;
  final List<Country> countries;
  const PlaceholderSearchField({
    Key? key,
    required this.placeholderText,
    required this.countries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SearchCountryScreen(countries:countries);
            },
          ),
        );
      },
      //context.pushNamed(Routes.searchRestaurant.name),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              color: Color(0xFFA4A4A4),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                placeholderText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF111111),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
