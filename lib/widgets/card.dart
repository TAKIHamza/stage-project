import 'package:flutter/material.dart';

Widget card (){
  return(
    Container(
  //width: MediaQuery.of(context).size.width * 0.45,
 
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        blurRadius: 4,
        color: Color(0x3600000F),
        offset: Offset(0, 2),
      )
    ],
    borderRadius: BorderRadius.circular(8),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1511725300345-f87a25ebb232?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
                  
                  
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: Text(
                  "produit"
                  
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsetsDirectional.fromSTEB(0,0 , 0, 0),
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     children: [
        //       Padding(
        //         padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        //         child: Text(
        //           "200 dh",
                  
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  ),
)
  );
}