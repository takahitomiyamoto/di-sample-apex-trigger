/*******************************************************
 * Name: AccountTriggerServiceTest.cls
 * Description: Test class for AccountTriggerService.cls
 ********************************************************/
@isTest(SeeAllData=false)

private class AccountTriggerServiceTest {

  @testSetup static void setup() {}

  @isTest static void onBeforeInsertTest() {
    Test.startTest();
    AccountTestUtils.insertAccounts();
    Test.stopTest();
  }

  @isTest static void onBeforeUpdateTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void onBeforeDeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsertTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdateTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndeleteTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    AccountTriggerService service = new AccountTriggerService((AccountTriggerHandler)handler);

    Test.startTest();
    service.onAfterUndelete();
    Test.stopTest();
  }

}