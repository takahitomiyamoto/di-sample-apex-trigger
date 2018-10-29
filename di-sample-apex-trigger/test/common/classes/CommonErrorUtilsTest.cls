/*******************************************************
 * Name: CommonErrorUtilsTest.cls
 * Description: Test class for CommonErrorUtils.cls
 ********************************************************/
@isTest(SeeAllData=false)
private class CommonErrorUtilsTest {

  @testSetup static void setup() {}

  @isTest static void createErrorMessageTest_Error() {
    String message = '';

    Test.startTest();
    Account account = new Account();
    Database.SaveResult result = Database.update(account, false);
    if (!result.isSuccess()) {
      Database.Error[] errors = result.getErrors();
      for (Database.Error error : errors) {
        message = CommonErrorUtils.createErrorMessage(error);
        System.assertNotEquals('', message);
      }
    }
    Test.stopTest();
  }

  @isTest static void createErrorMessageTest_Exception() {
    String message = '';

    Test.startTest();
    try {
      Account account = new Account();
      update account;
    } catch (Exception e) {
      message = CommonErrorUtils.createErrorMessage(e);
      System.assertNotEquals('', message);
    }
    Test.stopTest();
  }

}