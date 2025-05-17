import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/custom_shimmer.dart';

class CharacterInfoShimmer extends StatelessWidget {
  final Color color;
  const CharacterInfoShimmer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final darkenColor = Util.darken(color, 0.2);
    final colorText =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.5);
    final borderColor = Util.isDark(color) ? Colors.white : darkenColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/pickle_rick.png',
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 3),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  line(height: 20, width: 120),
                  SizedBox(height: 10),
                  line(height: 20, width: 130),
                  SizedBox(height: 10),
                  line(height: 20, width: 140),
                  SizedBox(height: 10),
                  line(height: 20, width: 90),
                  SizedBox(height: 10),
                  line(height: 20, width: 200),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last known location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorText,
                ),
              ),
              SizedBox(height: 10),
              line(height: 16, width: 220),
              SizedBox(height: 10),
              line(height: 15, width: 140),
            ],
          ),
        ),
        SizedBox(height: 20),
        CustomShimmer(
          color: color,
          child: SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder:
                  (_, __) => Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget line({double height = 20, double width = double.infinity}) {
    return CustomShimmer(
      color: color,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
