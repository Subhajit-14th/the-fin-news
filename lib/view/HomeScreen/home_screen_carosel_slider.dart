import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreenCaroselSlider extends StatelessWidget {
  const HomeScreenCaroselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, value) {
      return Center(
        child: Stack(
          children: [
            // Carosel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.95,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  provider.updateIndex(index);
                },
              ),
              items: provider.homeCarouselImageUrls.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),

            // Indicator Positioned at the Bottom Center of the Image
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: provider.activeIndex,
                  count: provider.homeCarouselImageUrls.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColor.primaryColor,
                    dotColor: Colors.white.withAlpha(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
