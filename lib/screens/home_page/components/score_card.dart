import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ScoreCard extends StatelessWidget {
  const ScoreCard({
    super.key, required this.time, required this.me, required this.against, required this.gameName,
  });
  final double time;
  final double me;
  final double against;
  final String gameName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(gameName.toUpperCase(),style: TextStyle(
              fontSize: 16.sp,fontWeight:FontWeight.w600
          ),),
          SizedBox(height: 4.sp,),
          Text("Time$time",style: TextStyle(
              fontSize: 16.sp,fontWeight:FontWeight.w400
          ),),
          SizedBox(height: 4.sp,),
          Text("[$me-$against]",style: TextStyle(
              fontSize: 16.sp,fontWeight:FontWeight.w600,color: Colors.red
          ),)


        ],
      ),
    );
  }
}