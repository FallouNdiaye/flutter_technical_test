import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.assets,
    this.description,
  }) : super(key: key);

  final String assets;
  final String? description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: Center(
        child: description != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    assets,
                    width: size.width * 0.7,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(description!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111111),
                      )),
                ],
              )
            : Lottie.asset(
                assets,
                width: size.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
