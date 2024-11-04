// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/screens/Home/ui/home_page.dart';
import 'package:grocery_app/screens/landing_page/Bloc/landing_page_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    landingBloc.add(LoadingEvent());
    super.initState();
  }

  final LandingBloc landingBloc = LandingBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0.1 * kToolbarHeight, 20, 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -1.3),
                child: Container(
                  height: 300,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.purple),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(3, 0.1),
                child: Container(
                  height: 150,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.purple),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocProvider(
                  create: (context) => landingBloc,
                  child: BlocConsumer<LandingBloc, LandingState>(
                    bloc: landingBloc,
                    listenWhen: (previous, current) =>
                        current is LandingActionState,
                    buildWhen: (previous, current) =>
                        current is! LandingActionState,
                    listener: (context, state) {
                      if (state is NavgiateState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    builder: (context, state) {
                      switch (state.runtimeType) {
                        case LoadingState:
                          return Scaffold(
                            body: Center(
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        case LoadingSuccessState:
                          return Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'images/1.png',
                                      scale: 8.7,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Order Your \nfavorites fruits",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Text(
                                        "Eat fresh fruits and try to be healthy",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 10,
                                            right: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Color(0xff1fc124),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Next",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            // Icon(Icons.forward),
                                            IconButton(
                                              onPressed: () {
                                                landingBloc
                                                    .add(NavgiateEvent());
                                              },
                                              icon: Icon(Icons.forward),
                                              color: Colors.white70,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          );
                        case LoadingErrorState:
                          return Scaffold(
                            body: Center(child: Text("Error")),
                          );
                        default:
                          return CircularProgressIndicator();
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
