import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/provider/books_provider.dart';
import 'package:flutter_boilerplate/feature/home/provider/home_provider.dart';
import 'package:flutter_boilerplate/feature/home/widget/row_book_widget.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/constants/app_theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var padding = MediaQuery.of(context).padding.top;
    var mediaHeight = MediaQuery.of(context).size.height - padding;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              //info
              Container(
                padding: EdgeInsets.only(left: 10),
                //color: Colors.red,
                height: mediaHeight * 0.15,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/person1.jpeg"),
                      maxRadius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Welcome, ",
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle:
                                  headline2.copyWith(color: secondaryColor),
                            ),
                          ),
                          TextSpan(
                            text: "Usama",
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle:
                                  headline2.copyWith(color: Colors.green),
                            ),
                          )
                        ])),
                        Text("Your latest updates are below.")
                      ],
                    )
                  ],
                ),
              ),
              //Card
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                height: mediaHeight * 0.25,
                width: mediaWidth,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.green.shade200,
                        Colors.green.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'VISA',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: headline2.copyWith(color: Colors.white),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Balance',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle: headline3.copyWith(
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$7,640',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              textStyle:
                                  headline1.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Text(
                          "**** 0123",
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            textStyle:
                                headline3.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          '05/25',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            textStyle:
                                headline3.copyWith(fontWeight: FontWeight.w400),
                          ),
                        )
                      ]),
                    ]),
              ),
              //Category
              Container(
                decoration: BoxDecoration(
                    color: secondaryPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(top: 10),
                height: mediaHeight * 0.6 - 10,
                width: mediaWidth,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quick Service",
                          style: GoogleFonts.getFont('Montserrat',
                              textStyle:
                                  headline3.copyWith(color: secondaryColor)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: mediaWidth / 4,
                              width: mediaWidth / 4,
                              decoration: BoxDecoration(
                                  color: lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send,
                                    color: backgroundColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Transfer",
                                    style: GoogleFonts.getFont('Montserrat',
                                        textStyle: headline3),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: mediaWidth / 4,
                              width: mediaWidth / 4,
                              decoration: BoxDecoration(
                                  color: lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send,
                                    color: backgroundColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Activity",
                                    style: GoogleFonts.getFont('Montserrat',
                                        textStyle: headline3),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: mediaWidth / 4,
                              width: mediaWidth / 4,
                              decoration: BoxDecoration(
                                  color: lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.send, color: backgroundColor),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "My Bank",
                                    style: GoogleFonts.getFont('Montserrat',
                                        textStyle: headline3),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Transactions',
                          style: GoogleFonts.getFont('Montserrat',
                              textStyle:
                                  headline3.copyWith(color: secondaryColor)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: mediaHeight * 0.1,
                                  width: mediaWidth,
                                  decoration: BoxDecoration(
                                      color: lightPrimaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.paid,
                                          color: Colors.green[200],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Go for Rewards",
                                              style: GoogleFonts.getFont(
                                                'Montserrat',
                                                textStyle: headline1,
                                              ),
                                            ),
                                            Text(
                                              "Income",
                                              style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  textStyle: headline3.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "\$50.00",
                                              style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  textStyle: headline3.copyWith(
                                                      color: secondaryColor,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            Text(
                                              "Hello World",
                                              style: GoogleFonts.getFont(
                                                  'Montserrat',
                                                  textStyle: headline3.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            )
                                          ],
                                        ),
                                      ]),
                                );
                              }),
                        )
                      ]),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  // Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
  //   return Container();
  // }

  // Widget _widgetContent(BuildContext context, WidgetRef ref) {
  //   final state = ref.watch(booksProvider);

  //   return state.when(
  //     loading: () {
  //       return _widgetShimmer(context, ref);
  //     },
  //     booksLoaded: (books) {
  //       return ListView.builder(
  //           itemCount: books.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return RowBookWidget(book: books[index]);
  //           });
  //     },
  //     error: (AppException error) {
  //       return _widgetShimmer(context, ref);
  //     },
  //   );
  // }
}
