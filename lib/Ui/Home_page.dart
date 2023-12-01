// ignore_for_file: unnecessary_null_comparison

import 'package:arnimo_test/Data/WeatherIcons.dart';
import 'package:arnimo_test/Data/variables.dart';
import 'package:arnimo_test/Data/widgets.dart';
import 'package:arnimo_test/bloc/bloc_structure_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
 final searchController = TextEditingController();
  // @override
  @override
  Widget build(BuildContext context) {
 

    hight = MediaQuery.of(context).size.height;
    widh = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("asset/IMG_7141.png"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          
            builder: (context, state) {
              
             if (state is WeatherInitial) {
            

                BlocProvider.of<WeatherBloc>(context).add(GetWeather());
                return const Center(child: CircularProgressIndicator());

          } else if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeCap: StrokeCap.round,
                
              ),
            );
          } else if (state is WeatherLoaded) {
               DateTime currentDateAndTime = DateTime.fromMillisecondsSinceEpoch(
        (state.datassss.dt ?? 0) * 1000,
        isUtc: true);
    String formattedDate =
        DateFormat('dd MMM yyyy').format(currentDateAndTime.toLocal());
    DateTime sunsetDateTime = DateTime.fromMillisecondsSinceEpoch(
        (state.datassss.sunset ?? 0) * 1000,
        isUtc: true);
    String formattedSunsetDate =
        DateFormat('HH:mm').format(sunsetDateTime.toLocal());
            return
            
             Scaffold(
              resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Container(
                            width: widh!*0.7,
                           // height: hight!*0.05,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(12, 26),
                                        blurRadius: 50,
                                        spreadRadius: 0,
                                        color: Colors.grey.withOpacity(.1)),
                                  ]),
                                  child: TextField(
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                    cursorColor: Colors.white,
                                    
                                   controller: searchController,
                                    onSubmitted: (value) {
                                      BlocProvider.of<WeatherBloc>(context).add(SearchWeather(searchController.text));
                                    },
                                    decoration:  InputDecoration(
                                      prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7),),
                                      filled: true,
                                      fillColor: const Color.fromARGB(170, 211, 154, 145),
                                      hintText: "Search Location",
                                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color:Color.fromARGB(198, 172, 115, 106), width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Color.fromARGB(198, 172, 115, 106), width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      ),
                                    ),
                                  ),
                              ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(right:15.0),
                            child: InkWell(
                              onTap: (){
                                 BlocProvider.of<WeatherBloc>(context).add(GetWeather());
                              },
                              child: Container(
                                
                                width: widh!*0.13,
                                height:hight!*0.055,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromARGB(170, 211, 154, 145)),
                                child: const Icon(Icons.location_pin,color: Colors.red,size: 30,),
                              ),
                            ),
                          )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:25,right: 25,top:10),
                      width: widh,
                      height: hight! * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFAC736A)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         const DropdownButtonExample(),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherIcons(state.datassss.description,
                                    const Color(0xFFF6C8A4)),
                                const SizedBox(width: 20),
                                state.datassss != null
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.ideographic,
                                        children: [
                                          Text(
                                            "${state.datassss.temp?.round().toString()}",
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFFF6C8A4),
                                              fontSize: 100,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(0,
                                                -50), // Adjust this value to lift the degree symbol
                                            child: Text(
                                              "°",
                                              style: GoogleFonts.poppins(
                                                color: const Color(0xFFF6C8A4),
                                                fontSize: 50,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeCap: StrokeCap.round,
                                      ),
                              ],
                            ),
                          ),
                          Text(
                           state.datassss.description ?? "Loading..",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFF6C8A4),
                              fontSize: 20,
                              fontWeight: FontWeight.w600 ,
                            ),
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: state.datassss.country ?? "Loading..",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ",",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: state.datassss.name ?? "Loading",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ])),
                          Text(
                            formattedDate.toString(),
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFF6C8A4),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text:
                                  "Feels like ${state.datassss.feelsLike?.round() ?? 0}",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " | ",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: "Sunset$formattedSunsetDate",
                              style: GoogleFonts.poppins(
                                color: const Color(0xFFF6C8A4),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ])),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(25),
                      width: widh,
                      height: hight! * 0.22,
                      decoration: ShapeDecoration(
                        gradient: const RadialGradient(
                          center: Alignment(0.49, 0.50),
                          radius: 0.39,
                          colors: [
                            Color.fromARGB(198, 172, 115, 106),
                            Color.fromARGB(170, 211, 154, 145),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widh,
                              height: hight! * 0.075,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      width: widh! * 0.15,
                                      height: hight! * 0.01,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            state.forecastdata.list[index].formattedDtTxt,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                  width: widh! * 0.06,
                                                  height: hight! * 0.03,
                                                  child: WeatherIcons(
                                                     state.forecastdata
                                                              .list[index]
                                                              .weather[0]
                                                              .description,
                                                      Colors.white)),
                                              Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: state.forecastdata
                                                      .list[index].main.temp
                                                      .round()
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "°",
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              ]))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1.5,
                              indent: 15,
                              endIndent: 15,
                            ),
                            SizedBox(
                              width: widh,
                              height: hight! * 0.075,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    int ind = index + 5;
                                    return Container(
                                        margin: const EdgeInsets.all(2),
                                        width: widh! * 0.15,
                                        height: hight! * 0.01,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              state.forecastdata.list[ind].formattedDtTxt,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                    width: widh! * 0.06,
                                                    height: hight! * 0.03,
                                                    child: WeatherIcons(
                                                        state.forecastdata
                                                                .list[ind]
                                                                .weather[0]
                                                                .description,
                                                        Colors.white)),
                                                Text.rich(TextSpan(children: [
                                                  TextSpan(
                                                    text: state.forecastdata
                                                        .list[ind].main.temp
                                                        .round()
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "°",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ]))
                                              ],
                                            )
                                          ],
                                        ));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                        
                       Expanded(
                         child: Container(
                            width: widh,
                            margin: const EdgeInsets.only(left: 25, right: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Random Text',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.75,
                                  child: Text(
                                    'Improve him believe opinion offered met and end cheered forbade. Friendly as stronger speedily by recurred. Son interest wandered sir addition end say. Manners beloved affixed picture men ask.',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                       )
                  ],
                ),
              );
            }  else if (state is WeatherError) {
            return Center(
              child: Center(child: Text('Something wrong happend please try again ',style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 16, 0, 0),
                fontSize: 10,

                


              ), )),
            );
          } else {
            return Container();
          }}
            
            
            
            
            
            ),
      ),
    );
  }
}
