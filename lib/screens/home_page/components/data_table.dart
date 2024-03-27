import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/consts/strings.dart';

class DataTableExample extends StatelessWidget {
  const DataTableExample({Key? key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DataTable(
        columnSpacing: 24.sp,
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                AppText.date,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp), // Adding .sp to the font size
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: SizedBox(
                width: 70.sp,
                child: Text(
                  AppText.bigBazaar,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp), // Adding .sp to the font size
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppText.noida,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp), // Adding .sp to the font size
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppText.palwal,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp), // Adding .sp to the font size
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppText.delhi,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp), // Adding .sp to the font size
              ),
            ),
          ),
        ],
        rows:  <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('10/11/2093', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('19', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('76', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('66', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('54', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('10/11/2093', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('43', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('11', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('14', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('56', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('10/11/2093', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('20', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('45', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('27', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
              DataCell(Text('32', style: TextStyle(fontSize: 14.sp))), // Adding .sp to the font size
            ],
          ),
        ],
      ),
    );
  }
}
