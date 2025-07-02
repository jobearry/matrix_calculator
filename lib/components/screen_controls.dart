import 'package:flutter/material.dart';

Container screenControls(double width, double height) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      
    ),
    child: Container(
      decoration: BoxDecoration(
        
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text("<"),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Text(">")
          ),
        ],
      ),
    )
  );
}