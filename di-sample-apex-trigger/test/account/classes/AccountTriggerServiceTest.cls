/*******************************************************
 * Name: AccountTriggerServiceTest.cls
 * Description: Test class for AccountTriggerService.cls
 ********************************************************/
@isTest(SeeAllData=false)

private class AccountTriggerServiceTest {

  // @testSetup static void setup() {}

  // @isTest static void onBeforeInsertTest() {
  //   Test.startTest();
  //   AccountTestUtils.insertAccounts();
  //   Test.stopTest();
  // }

  @isTest static void onBeforeUpdateTest() {
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

    Test.startTest();
    service.onBeforeUpdate();
    Test.stopTest();
  }

  // @isTest static void onBeforeDeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

  //   Test.startTest();
  //   service.onBeforeDelete();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterInsertTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

  //   Test.startTest();
  //   service.onAfterInsert();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterUpdateTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

  //   Test.startTest();
  //   service.onAfterUpdate();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterDeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

  //   Test.startTest();
  //   service.onAfterDelete();
  //   Test.stopTest();
  // }

  // @isTest static void onAfterUndeleteTest() {
  //   CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
  //   ITriggerObserver service = new AccountTriggerService().getTriggerObserver(handler);

  //   Test.startTest();
  //   service.onAfterUndelete();
  //   Test.stopTest();
  // }

}