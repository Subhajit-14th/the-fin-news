import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/merketdata_provider.dart';

class MerketDataScreen extends StatefulWidget {
  const MerketDataScreen({super.key});

  @override
  State<MerketDataScreen> createState() => _MerketDataScreenState();
}

class _MerketDataScreenState extends State<MerketDataScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (!mounted) return;
        context.read<MerketdataProvider>().getMarketCategoryData();
        context.read<MerketdataProvider>().getMarketData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.textColorDark.withAlpha(40),
              ),
            ),
          ),
          child: Consumer<MerketdataProvider>(
              builder: (context, marketDataProvider, child) {
            return Row(
              children: List.generate(
                marketDataProvider.metketDataHeadingCategoryItems.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      marketDataProvider.setMetketDataIndex(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: marketDataProvider.selectedIndex == index
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        borderRadius: marketDataProvider.selectedIndex == index
                            ? BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                              )
                            : BorderRadius.zero,
                      ),
                      child: Text(
                        marketDataProvider
                            .metketDataHeadingCategoryItems[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: marketDataProvider.selectedIndex == index
                              ? AppColor.textColorLight
                              : AppColor.textColorDark,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),

        /// Body Section
        Consumer<MerketdataProvider>(
            builder: (context, marketDataProvider, child) {
          return ListView.builder(
            itemCount: marketDataProvider.marketData.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Date
                    Text(
                      "${marketDataProvider.marketData[index].date}",
                      style: TextStyle(
                        color: AppColor.textColorDark,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14),

                    /// Nifty Value
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: RichText(
                        text: TextSpan(
                          text: 'Nifty ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "${marketDataProvider.marketData[index].value1}",
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${marketDataProvider.marketData[index].value2}(${marketDataProvider.marketData[index].value3})',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Fii Cash
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2323FF),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.textColorDark.withAlpha(50),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: AppColor.tertiaryColor,
                        title: Row(
                          spacing: 24,
                          children: [
                            Text(
                              'FII Cash',
                              style: TextStyle(
                                color: AppColor.textColorLight,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${marketDataProvider.marketData[index].price}",
                              style: TextStyle(
                                color: double.parse(marketDataProvider
                                                .marketData[index].price ??
                                            '') <
                                        0
                                    ? Color(0xffFF1818)
                                    : Color(0xFF39FF14),
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          'Details >',
                          style: TextStyle(
                            color: AppColor.textColorLight,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    /// Dii Cash
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2323FF),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.textColorDark.withAlpha(50),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: AppColor.tertiaryColor,
                        title: Row(
                          spacing: 24,
                          children: [
                            Text(
                              'DII Cash',
                              style: TextStyle(
                                color: AppColor.textColorLight,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${marketDataProvider.marketData[index].price2}",
                              style: TextStyle(
                                color: double.parse(
                                            '${marketDataProvider.marketData[index].price2}') <
                                        0
                                    ? Colors.red
                                    : Colors.green,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          'Details >',
                          style: TextStyle(
                            color: AppColor.textColorLight,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        spacing: 20,
                        children: [
                          Text(
                            'Net:',
                            style: TextStyle(
                              color: AppColor.textColorDark,
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "669.6",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        })
      ],
    );
  }
}
