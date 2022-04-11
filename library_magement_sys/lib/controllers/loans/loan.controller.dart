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


  get act => null;

  get acc => null;

   @override
  void onInit(){
    allLoansController();
    singleLoanController(act, acc);
    super.onInit();
  }

  createaLoan(bookId, bookAccNo)async{
    var loan = await LoanService.createLoan(bookId, bookAccNo);
  }

  studentLoanController() async {
    var studentloans = await LoanService.studentLoans();
    var stdloans = studentloans!.first.loans;
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

   singleLoanController(act, acc) async { 
  var id = Get.parameters['id'];
   try{
    isLoading(true);
   var loan = await LoanService.singleLoan(id, act, acc);
   var findloan = loan!.loans;
    singleLoanList.value = [findloan];
   }finally{
     isLoading(false);
   }
  }

}