/*******************************************************
 * Name: CommonTriggerHandlerTest.cls
 * Description: Test class for CommonTriggerHandler.cls
 ********************************************************/
@isTest(SeeAllData=false)
private class CommonTriggerHandlerTest {

  private class CommonTriggerObserverMock implements ITriggerObserver {

    private CommonTriggerHandler handler;
    public CommonTriggerObserverMock() {}
    public ITriggerObserver getTriggerObserver(CommonTriggerHandler handler) {
      this.handler = handler;
      return (ITriggerObserver)this;
    }

    public void onBeforeInsert() {}
    public void onBeforeUpdate() {}
    public void onBeforeDelete() {}
    public void onAfterInsert() {}
    public void onAfterUpdate() {}
    public void onAfterDelete() {}
    public void onAfterUndelete() {}
  }

  @testSetup static void setup() {
    AccountTestUtils.insertAccounts();
  }

  @isTest static void onBeforeInsertTest() {}

  @isTest static void onBeforeUpdateTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.beforeUpdateObservers.add(triggerObserver);

    Test.startTest();
    handler.onBeforeUpdate();
    Test.stopTest();
  }

  @isTest static void onBeforeDeleteTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.beforeDeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onBeforeDelete();
    Test.stopTest();
  }

  @isTest static void onAfterInsertTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterInsertObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterInsert();
    Test.stopTest();
  }

  @isTest static void onAfterUpdateTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterUpdateObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterUpdate();
    Test.stopTest();
  }

  @isTest static void onAfterDeleteTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterDeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterDelete();
    Test.stopTest();
  }

  @isTest static void onAfterUndeleteTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    handler.afterUndeleteObservers.add(triggerObserver);

    Test.startTest();
    handler.onAfterUndelete();
    Test.stopTest();
  }

  @isTest static void addObserverTest() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());
    ITriggerObserver triggerObserver = (ITriggerObserver)CommonTriggerObserverMock.class.newInstance();
    List<System.TriggerOperation> triggerOperations = new List<System.TriggerOperation>{
      System.TriggerOperation.BEFORE_INSERT,
      System.TriggerOperation.BEFORE_UPDATE,
      System.TriggerOperation.BEFORE_DELETE,
      System.TriggerOperation.AFTER_INSERT,
      System.TriggerOperation.AFTER_UPDATE,
      System.TriggerOperation.AFTER_DELETE,
      System.TriggerOperation.AFTER_UNDELETE
    };

    Test.startTest();
    handler.addObserver(triggerOperations, triggerObserver);
    Test.stopTest();
  }

  @isTest static void createTriggerObserverTest_NULL() {
    // List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());

    Test.startTest();
    ITriggerObserver triggerObserver = handler.createTriggerObserver(null);
    Test.stopTest();

    System.assertEquals(null, triggerObserver);
  }

  @isTest static void isRecursiveTest_Undelete() {
    List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());

    Test.startTest();
    AccountTestUtils.deleteAccounts(accounts);
    AccountTestUtils.undeleteAccounts(accounts);
    Test.stopTest();
  }

  @isTest static void isRecursiveTest_NonFirstRun() {
    List<Account> accounts = AccountTestUtils.selectAccounts();
    CommonTriggerHandler handler = new CommonTriggerHandler(Account.class.getName());

    Test.startTest();
    CommonTriggerHandler.firstRun = false;
    Boolean isRecursive = handler.isRecursive();
    Test.stopTest();

    System.assertEquals(true, isRecursive);
  }

  @isTest static void invokeTest_BeforeUpdate() {
    List<Account> accounts = AccountTestUtils.selectAccounts();

    Test.startTest();
    AccountTestUtils.updateAccounts(accounts);
    Test.stopTest();
  }

}