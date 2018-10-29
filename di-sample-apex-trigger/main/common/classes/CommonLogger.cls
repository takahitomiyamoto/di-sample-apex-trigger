/***********************************
 * Name: CommonLogger.cls
 * Description: Common logger class
 ***********************************/
public without sharing class CommonLogger {

  // Constants
  private static final System.loggingLevel LOGGING_LEVEL_DEFAULT = CommonConstants.LOGGING_LEVEL_DEFAULT;
  private static final String CLASS_NAME = CommonLogger.class.getName();
  private static final String DATE_FORMAT = CommonConstants.DATE_FORMAT;
  private static final String MSG_NEW_INSTANCE_CREATED = CommonConstants.MSG_NEW_INSTANCE_CREATED;
  private static final String PARTING_LINE = CommonConstants.PARTING_LINE;
  private static final String SYMBOL_SPACE = CommonConstants.SYMBOL_SPACE;
  private static final String SYMBOL_CLS = CommonConstants.SYMBOL_CLS;
  private static final String SYMBOL_SEMICOLON = CommonConstants.SYMBOL_SEMICOLON;
  private static final String SYMBOL_NEWLINE = CommonConstants.SYMBOL_NEWLINE;
  private static final String TIMEZONE_JST = CommonConstants.TIMEZONE_JST;
  private static final Integer MAX_WIDTH = CommonConstants.MAX_WIDTH;

  // Class Variables
  private static CommonLogger singletonCommonLogger = new CommonLogger();

  // Instance Variables
  private List<String> debuglogs = new List<String>();
  private String timestampNow;

  /*********************************************
   * Name: CommonLogger
   * Description: Constructor with no parameter
   *
   * @param  null
   * @return CommonLogger
   *********************************************/
  private CommonLogger() {
    System.debug(LOGGING_LEVEL_DEFAULT, MSG_NEW_INSTANCE_CREATED);
    this.timestampNow = String.valueof(Datetime.now().format(DATE_FORMAT, TIMEZONE_JST));
  }

  /************************************
   * Name: getInstance
   * Description: Get the instance
   *
   * @param  null
   * @return CommonLogger
   ************************************/
  public static CommonLogger getInstance() {
    return singletonCommonLogger;
  }

  /****************************************
   * Name: stackDebugLog
   * Description: Stack the debugLog
   *
   * @param  LoggingLevel loggingLevel
   * @param  String className
   * @param  String methodName
   * @param  Object msg
   * @return void
   ****************************************/
  public void stackDebugLog(System.LoggingLevel loggingLevel, String className, String methodName, Object msg) {
    System.LoggingLevel labelLoggingLevel = CommonLogger.getLoggingLevel(LOGGING_LEVEL_DEFAULT.name());

    // ログレベルが高ければ出力する
    if (loggingLevel.ordinal() >= labelLoggingLevel.ordinal()) {
      String debugLog = '' +
        String.valueOf(loggingLevel) + SYMBOL_SPACE +
        className + SYMBOL_CLS + SYMBOL_SPACE +
        methodName + SYMBOL_SPACE +
        msg;

      this.debuglogs.add(debugLog);
    }
  }

  /***********************************
   * Name: fetchDebugLogs
   * Description: Fetch all debugLogs
   *
   * @param  null
   * @return void
   ***********************************/
  public void fetchDebugLogs() {
    if (this.debuglogs.size() == 0) {
      return;
    }

    String log = '' +
      this.timestampNow + SYMBOL_NEWLINE +
      String.join(this.debuglogs, SYMBOL_NEWLINE);

    Boolean isLong = (log.length() > MAX_WIDTH);
    if (isLong) {
      log = log.abbreviate(MAX_WIDTH);
    }

    System.debug(LOGGING_LEVEL_DEFAULT, PARTING_LINE);
    System.debug(LOGGING_LEVEL_DEFAULT, log);
    System.debug(LOGGING_LEVEL_DEFAULT, PARTING_LINE);

    this.debuglogs.clear();
  }

  /***********************************
   * Name: getLoggingLevel
   * Description: Get LoggingLevel
   *
   * @param  String value
   * @return System.LoggingLevel
   ***********************************/
  @TestVisible
  private static System.LoggingLevel getLoggingLevel(String value) {
    switch on value {
      when 'NONE' {
        return System.LoggingLevel.NONE;
      }
      when 'ERROR' {
        return System.LoggingLevel.ERROR;
      }
      when 'WARN' {
        return System.LoggingLevel.WARN;
      }
      when 'INFO' {
        return System.LoggingLevel.INFO;
      }
      when 'DEBUG' {
        return System.LoggingLevel.DEBUG;
      }
      when 'FINE' {
        return System.LoggingLevel.FINE;
      }
      when 'FINER' {
        return System.LoggingLevel.FINER;
      }
      when 'FINEST' {
        return System.LoggingLevel.FINEST;
      }
      when else {
        return System.LoggingLevel.DEBUG;
      }
    }
  }

}