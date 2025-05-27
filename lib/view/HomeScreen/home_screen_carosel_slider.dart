import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/HomeScreen/home_carosel_slider_details.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';

class HomeScreenCaroselSlider extends StatelessWidget {
  const HomeScreenCaroselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, value) {
      return Column(
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
            items: provider.homeCarouselImageUrls.map((item) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeCaroselSliderDetails(
                                image: item.image,
                                title: item.title,
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        item.image,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            CachedNetworkImage(
                          imageUrl:
                              'https://dhanvan.in/public/images/upload/prod_default.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 6, right: 6, bottom: 6),
                        decoration: BoxDecoration(
                          color: AppColor.textColorDark.withAlpha(50),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                color: AppColor.textColorLight,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),

          // Indicator Positioned at the Bottom Center of the Image
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: provider.activeIndex,
              count: provider.homeCarouselImageUrls.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColor.primaryColor,
                dotColor: Colors.grey.withAlpha(140),
              ),
            ),
          ),
        ],
      );
    });
  }
}
