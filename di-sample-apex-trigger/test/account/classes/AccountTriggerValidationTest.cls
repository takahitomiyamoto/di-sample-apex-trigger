/*******************************************************
 * Name: AccountTriggerValidationTest.cls
 * Description: Test class for AccountTriggerValidation.cls
 ********************************************************/
@isTest(SeeAllData=false)
private class AccountTriggerValidationTest {

  @testSetup static void setup() {
    AccountTestUtils.insertAccounts();
  }

  @isTest static void onBeforeInsertTest() {
    Test.startTest();
    AccountTestUtils.insertAccounts();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdateTest() {
    List<Account> accounts = AccountTestUtils.selectAccounts();

    Test.startTest();
    AccountTestUtils.updateAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void onBeforeDeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerValidation validation = new AccountTriggerValidation((AccountTriggerHandler)handler);

    Test.startTest();
    validation.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsertTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerValidation validation = new AccountTriggerValidation((AccountTriggerHandler)handler);

    Test.startTest();
    validation.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdateTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerValidation validation = new AccountTriggerValidation((AccountTriggerHandler)handler);

    Test.startTest();
    validation.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerValidation validation = new AccountTriggerValidation((AccountTriggerHandler)handler);

    Test.startTest();
    validation.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerValidation validation = new AccountTriggerValidation((AccountTriggerHandler)handler);

    Test.startTest();
    validation.onAfterUndelete();
    Test.stopTest();
  }

}