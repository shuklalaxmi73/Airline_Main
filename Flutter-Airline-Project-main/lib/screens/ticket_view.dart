import 'package:aeroplane/utils/app_layout.dart';
import 'package:aeroplane/utils/app_styles.dart';
import 'package:aeroplane/widgets/thick_container.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget { 
final Map<String,dynamic> tombo;

const TicketView({Key? key,required this.tombo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height:200,
      child: Container(
        margin:  const EdgeInsets.only(right: 16),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Blue part of the card/ticket
          Container(
            decoration:  const BoxDecoration (
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21))),
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    tombo['from']['code'],
                    style: Styles.headlineStyle3.copyWith(color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  const ThickContainer(),//thickcontainer
                  Expanded(
                      child: Stack(
                    children: [
                      SizedBox(
                        height: 24,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (constraints.constrainWidth() / 6).floor(),
                                  (index) => const SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.white)),
                                      )),
                            );
                          },
                        ),
                      ),
                      Center(
                          child: Transform.rotate(
                        angle: 1.5,
                        child: const Icon(
                          Icons.local_airport_rounded,
                          color: Colors.white,
                        ),
                      )),
                    ],
                  )),
                  const ThickContainer(),//thickcontainer
                  Expanded(child: Container()),
                  Text(
                    tombo['to']['code'],
                    style: Styles.headlineStyle3.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const Gap(3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      tombo['from']['name'],
                      style:
                          Styles.headlineStyle4.copyWith(color: Colors.white),
                    ),
                  ),
                  Text(
                    tombo['flying_time'],
                    style: Styles.headlineStyle4.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width:100,
                    child: Text(
                     tombo['to']['name'],
                      textAlign: TextAlign.end,
                      style:
                          Styles.headlineStyle4.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ]),
          ),
          //showing orange part
           Container(
            color:const  Color(0xFFF37867),
            child: Row(children: [
               SizedBox (
                height: 20,
                width: 10,
              child: const DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)))),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        (constraints.constrainWidth() / 15).floor(),
                        (index) => const SizedBox(
                          width: 5,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
                width: 10,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)))),
              ),
            ]),
          ),
          //showing bottom of the orange part
          Container(
            decoration: BoxDecoration(
              color: Styles.orangecolor,
              borderRadius:  const BorderRadius.only(
              bottomLeft: Radius.circular(21),
              bottomRight: Radius.circular(21))
            ),
              padding: const EdgeInsets.only(left:16,top: 10,right: 16,bottom: 16, ),
                child: Column(children: [
                        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tombo['date'],style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                                const Gap(5),
                                Text("Date",style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                                
                              ],
                            ),
                               
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(tombo['departure_time'],style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                                const Gap(5),
                                Text("Departure time",style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                                
                              ],
                            ),
                            //end 
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(tombo['number'].toString(),style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                                const Gap(5),
                                Text("Number",style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                                
                              ],
                            ),
                              //center
                             
                          ],
                        ),
                ],
                ),
          ),
          ],
        ),
      ),
    );
  }
}
