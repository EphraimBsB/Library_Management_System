import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_magement_sys/views/pages/book.pages/book.management.dart';
import 'package:library_magement_sys/views/pages/book.pages/home.page.dart';
import 'package:library_magement_sys/views/pages/book.pages/searched.book.page.dart';
import 'package:library_magement_sys/views/pages/book.pages/welcome.page.dart';
import 'package:library_magement_sys/views/pages/loan.pages/loans.management.dart';
import 'package:library_magement_sys/views/pages/loan.pages/single.loan.dart';
import 'package:library_magement_sys/views/pages/loan.pages/student.loan.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/librarian.login.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/login.page.dart';
import 'package:library_magement_sys/views/pages/user.pages/signup.page.dart';

void main() {
  runApp(const LibraryManagementSystem());
}

class LibraryManagementSystem extends StatelessWidget {
  const LibraryManagementSystem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'library management',
      // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/books/book/:id', page: () => SearchedBook()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/admin', page: () => LibrarianLoginPage()),
        GetPage(name: '/register', page: () => SignupPage()),
        GetPage(name: '/student_loans', page: () => StudentLoanPage()),
        GetPage(name: '/books_management', page: () => BooksManagement()),
        GetPage(name: '/loans_management', page: () => LoansManagement()),
        GetPage(name: '/loans_management/loan/:id', page: () => SingleLoan()),
      ],
    );
  }
}