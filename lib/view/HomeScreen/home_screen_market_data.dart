import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/viewModel/merketdata_provider.dart';

class HomeScreenMarketData extends StatelessWidget {
  const HomeScreenMarketData({super.key});

  @override
  Widget build(BuildContext context) {
    final marketDataProvider = Provider.of<MerketdataProvider>(context);
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 255,
      child: ListView.builder(
        itemCount: marketDataProvider.marketData.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        itemBuilder: (context, index) {
          return Container(
            width: 350,
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
                          "${marketDataProvider.marketData[index]['fiiCash']}",
                          style: TextStyle(
                            color: marketDataProvider.marketData[index]
                                        ['fiiCash'] <
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
      ),
    );
  }
}
