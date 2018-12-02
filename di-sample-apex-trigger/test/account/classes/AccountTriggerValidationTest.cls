/*******************************************************
 * Name: AccountTriggerValidationTest.cls
 * Description: Test class for AccountTriggerValidation.cls
 ********************************************************/
@isTest(SeeAllData=false)
private class AccountTriggerValidationTest {

  // @testSetup static void setup() {
  //   AccountTestUtils.insertAccounts();
  // }

  // @isTest static void onBeforeInsertTest() {
  //   Test.startTest();
  //   AccountTestUtils.insertAccounts();
  //   Test.stopTest();
  // }

  // @isTest static void onBeforeUpdateTest() {
  //   List<Account> accounts = AccountTestUtils.selectAccounts();

  //   Test.startTest();
  //   AccountTestUtils.updateAccounts(accounts);
  //   Test.stopTest();
  // }

  // @isTest static void onBeforeDeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver validation = new AccountTriggerValidation().getTriggerObserver(handler);

  //   Test.startTest();
  //   validation.onBeforeDelete();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterInsertTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver validation = new AccountTriggerValidation().getTriggerObserver(handler);

  //   Test.startTest();
  //   validation.onAfterInsert();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterUpdateTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver validation = new AccountTriggerValidation().getTriggerObserver(handler);

  //   Test.startTest();
  //   validation.onAfterUpdate();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterDeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver validation = new AccountTriggerValidation().getTriggerObserver(handler);

  //   Test.startTest();
  //   validation.onAfterDelete();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterUndeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver validation = new AccountTriggerValidation().getTriggerObserver(handler);

  //   Test.startTest();
  //   validation.onAfterUndelete();
  //   Test.stopTest();
  // }

}