import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/merketdata_provider.dart';

class MerketDataScreen extends StatelessWidget {
  const MerketDataScreen({super.key});

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
                marketDataProvider.metketDataHeadingItems.length,
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
                        marketDataProvider.metketDataHeadingItems[index],
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
                      marketDataProvider.marketData[index]['date'],
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
                                  "${marketDataProvider.marketData[index]['nifty']['value']}",
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${marketDataProvider.marketData[index]['nifty']['change']}(${marketDataProvider.marketData[index]['nifty']['percent']})',
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
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        tileColor: AppColor.tertiaryColor,
                        title: Row(
                          spacing: 24,
                          children: [
                            Text(
                              'FII Cash',
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${marketDataProvider.marketData[index]['fiiCash']}",
                              style: TextStyle(
                                color: marketDataProvider.marketData[index]
                                            ['fiiCash'] <
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
                            color: AppColor.textColorDark,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),

                    /// Dii Cash
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        tileColor: AppColor.tertiaryColor,
                        title: Row(
                          spacing: 24,
                          children: [
                            Text(
                              'DII Cash',
                              style: TextStyle(
                                color: AppColor.textColorDark,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${marketDataProvider.marketData[index]['diiCash']}",
                              style: TextStyle(
                                color: marketDataProvider.marketData[index]
                                            ['diiCash'] <
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
                            color: AppColor.textColorDark,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),

                    Padding(
                      padding: const EdgeInsets.only(left: 14),
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
                            "${marketDataProvider.marketData[index]['net']}",
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
