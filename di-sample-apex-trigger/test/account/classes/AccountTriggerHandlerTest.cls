/*******************************************************
 * Name: AccountTriggerHandlerTest.cls
 * Description: Test class for AccountTriggerHandler.cls
 ********************************************************/
@isTest(SeeAllData=false)

private class AccountTriggerHandlerTest {

  @testSetup static void setup() {
    AccountTestUtils.insertAccounts();
  }

  @isTest static void addObserversTest() {
    BaseTriggerHandler handler = new AccountTriggerHandler();

    Test.startTest();
    handler.addObservers(Account.class.getName());
    Test.stopTest();
  }

  @isTest static void onBeforeDeleteTest() {
    List<Account> accounts = AccountTestUtils.selectAccounts();

    Test.startTest();
    AccountTestUtils.deleteAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void onAfterUndeleteTest() {
    List<Account> accounts = AccountTestUtils.selectAccounts();
    AccountTestUtils.deleteAccounts(accounts);

    Test.startTest();
    AccountTestUtils.undeleteAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void addObserverTest_BEFORE_DELETE() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    System.TriggerOperation[] activeTriggerOperation = new System.TriggerOperation[]{};
    activeTriggerOperation.add(System.TriggerOperation.BEFORE_DELETE);
    ITriggerObserver triggerObserver = (ITriggerObserver)AccountTriggerService.getInstance((AccountTriggerHandler)handler);

    Test.startTest();
    handler.addObserver(activeTriggerOperation, triggerObserver);
    handler.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void addObserverTest_AFTER_INSERT() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    System.TriggerOperation[] activeTriggerOperation = new System.TriggerOperation[]{};
    activeTriggerOperation.add(System.TriggerOperation.AFTER_INSERT);
    ITriggerObserver triggerObserver = (ITriggerObserver)AccountTriggerService.getInstance((AccountTriggerHandler)handler);

    Test.startTest();
    handler.addObserver(activeTriggerOperation, triggerObserver);
    handler.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void addObserverTest_AFTER_UPDATE() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    System.TriggerOperation[] activeTriggerOperation = new System.TriggerOperation[]{};
    activeTriggerOperation.add(System.TriggerOperation.AFTER_UPDATE);
    ITriggerObserver triggerObserver = (ITriggerObserver)AccountTriggerService.getInstance((AccountTriggerHandler)handler);

    Test.startTest();
    handler.addObserver(activeTriggerOperation, triggerObserver);
    handler.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void addObserverTest_AFTER_DELETE() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    System.TriggerOperation[] activeTriggerOperation = new System.TriggerOperation[]{};
    activeTriggerOperation.add(System.TriggerOperation.AFTER_DELETE);
    ITriggerObserver triggerObserver = (ITriggerObserver)AccountTriggerService.getInstance((AccountTriggerHandler)handler);

    Test.startTest();
    handler.addObserver(activeTriggerOperation, triggerObserver);
    handler.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void addObserverTest_AFTER_UNDELETE() {
    BaseTriggerHandler handler = new AccountTriggerHandler();
    System.TriggerOperation[] activeTriggerOperation = new System.TriggerOperation[]{};
    activeTriggerOperation.add(System.TriggerOperation.AFTER_UNDELETE);
    ITriggerObserver triggerObserver = (ITriggerObserver)AccountTriggerService.getInstance((AccountTriggerHandler)handler);

    Test.startTest();
    handler.addObserver(activeTriggerOperation, triggerObserver);
    handler.onAfterUndelete();
    Test.stopTest();
  }

  @isTest static void createTriggerObserverTest_Null() {
    BaseTriggerHandler handler = new AccountTriggerHandler();

    Test.startTest();
    ITriggerObserver observer = handler.createTriggerObserver(null);
    Test.stopTest();
  }

  @isTest static void createTriggerObserverTest_Others() {
    BaseTriggerHandler handler = new AccountTriggerHandler();

    Test.startTest();
    ITriggerObserver observer = handler.createTriggerObserver(Account.class);
    Test.stopTest();
  }

}