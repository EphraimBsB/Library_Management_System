import 'package:get/get.dart';
import 'package:library_magement_sys/models/loan.model/all.loans.model.dart';
import 'package:library_magement_sys/models/loan.model/student.loan.model.dart';
import 'package:library_magement_sys/models/loan.model/single.loan.model.dart';
import 'package:library_magement_sys/services/loan.service/loan.service.dart';

class LoanController extends GetxController{
  var isLoading = true.obs;
  var studentLoans = <Loans>[].obs;
  var loansList = <AllLoan>[].obs;
  var singleLoanList = <SingleLoans>[].obs;

  get book => null;

  get act => null;

   @override
  void onInit(){
    allLoansController();
    singleLoanController(act);
    // studentLoanController(book);
    super.onInit();
  }

  createaLoan(bookId)async{
    var loan = await LoanService.createLoan(bookId);
  }

  studentLoanController() async {
    var studentloans = await LoanService.studentLoans();
    var stdloans = studentloans!.first.loans;
    print(stdloans);
    if(studentloans != null){
      studentLoans.value = [stdloans];
    }else{
      return null;
    }
  }

  allLoansController() async{
    var loans = await LoanService.allLoans();
    var loan = loans!.first.loans;
    if(loans != null){
      loansList.value = loan;
    }
  }

   singleLoanController(act) async { 
  var id = Get.parameters['id'];
   try{
    isLoading(true);
   var loan = await LoanService.singleLoan(id, act);
   var findloan = loan!.loans;
    singleLoanList.value = [findloan];
   }finally{
     isLoading(false);
   }
  }

}