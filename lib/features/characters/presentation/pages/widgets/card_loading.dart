import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/shared/presentation/widgets/custom_shimmer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
      child: CustomShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/placeholder.svg', height: 180),
            SizedBox(height: 20),
            line(height: 10, width: 140),
            SizedBox(height: 10),
            line(height: 10, width: 90),
            SizedBox(height: 10),
            line(height: 10, width: 120),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget line({double height = 20, double width = double.infinity}) {
    return CustomShimmer(
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
