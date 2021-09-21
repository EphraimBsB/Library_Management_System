import 'package:get/get.dart';
import 'package:library_magement_sys/models/loan.model/all.loans.model.dart';
import 'package:library_magement_sys/models/loan.model/loan.model.dart';
import 'package:library_magement_sys/services/loan.service/loan.service.dart';

class LoanController extends GetxController{
  var studentLoans = <Loans>[].obs;
  var loansList = <AllLoan>[].obs;

  get book => null;

   @override
  void onInit(){
    allLoansController();
    // studentLoanController(book);
    super.onInit();
  }

  studentLoanController(book) async {
    var studentloans = await LoanService.studentLoans(book);
    var stdloans = studentloans!.first.loans;
    if(studentloans != null){
      studentLoans.value = [stdloans];
    }
  }

  allLoansController() async{
    var loans = await LoanService.allLoans();
    var loan = loans!.first.loans;
    if(loans != null){
      loansList.value = loan;
    }
    
  }

}