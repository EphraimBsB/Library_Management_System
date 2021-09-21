import 'package:flutter/material.dart';
import 'package:library_magement_sys/models/book.model/book.model.dart';

class ManagementTable extends StatelessWidget {
  final Book bookModel;
  ManagementTable(this.bookModel);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Image',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Title',
                            style: TextStyle(fontSize:18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Author',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'DDC Number',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'AC Number',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Category',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Options',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                      rows: <DataRow>[DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                            height: 90,
                            width: 50,
                            child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/I/41GMu1OBEgL._SX366_BO1,204,203,200_.jpg',
                            fit: BoxFit.cover,
                          ),
                          ),
                              ),),
                             const DataCell(Text(
                              'Data',
                              style: TextStyle(fontSize: 16),
                            )),
                             const DataCell(Text(
                              'Data',
                              style: TextStyle(fontSize: 16),
                            )),
                             const DataCell(Text(
                              'Data',
                              style: TextStyle(fontSize: 16),
                            )),
                             const DataCell(Text(
                              'Data',
                              style:TextStyle(fontSize: 16),
                            )),
                             const DataCell(Text(
                              'Data',
                              style: TextStyle(fontSize: 16),
                            )),
                             const DataCell(
                               Text(
                                 'Data',
                              style: TextStyle(fontSize: 16),
                            )),
                             const DataCell(Text(
                              'data',
                              style: TextStyle(fontSize: 16),
                            )),
                          ],
                        ),
                      ]
                    ),
            );
  }
}