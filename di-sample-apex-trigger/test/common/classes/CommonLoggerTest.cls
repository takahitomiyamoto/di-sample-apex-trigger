/*******************************************************
 * Name: CommonLoggerTest.cls
 * Description: Test class for CommonLogger.cls
 ********************************************************/
@isTest(SeeAllData=false)
private class CommonLoggerTest {

  @testSetup static void setup() {}

  @isTest static void fetchDebugLogsTest() {
    CommonLogger logger = CommonLogger.getInstance();
    String maxWidthMsg = '';
    for (Integer i = 0; i < 130000; i++) {
      maxWidthMsg += 'a';
    }

    Test.startTest();
    logger.stackDebugLog(LoggingLevel.DEBUG, 'CLASS_NAME', 'methodName', maxWidthMsg);
    logger.fetchDebugLogs();
    Test.stopTest();
  }

  @isTest static void fetchDebugLogsTest_ZERO() {
    CommonLogger logger = CommonLogger.getInstance();

    Test.startTest();
    logger.fetchDebugLogs();
    Test.stopTest();
  }

  @isTest static void getLoggingLevelTest_NONE() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('NONE');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.NONE, level);
  }

  @isTest static void getLoggingLevelTest_ERROR() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('ERROR');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.ERROR, level);
  }

  @isTest static void getLoggingLevelTest_WARN() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('WARN');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.WARN, level);
  }

  @isTest static void getLoggingLevelTest_INFO() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('INFO');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.INFO, level);
  }

  @isTest static void getLoggingLevelTest_FINE() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('FINE');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.FINE, level);
  }

  @isTest static void getLoggingLevelTest_FINER() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('FINER');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.FINER, level);
  }

  @isTest static void getLoggingLevelTest_FINEST() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('FINEST');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.FINEST, level);
  }

  @isTest static void getLoggingLevelTest_OTHERS() {
    Test.startTest();
    System.LoggingLevel level = CommonLogger.getLoggingLevel('OTHERS');
    Test.stopTest();

    System.assertEquals(System.LoggingLevel.DEBUG, level);
  }

}