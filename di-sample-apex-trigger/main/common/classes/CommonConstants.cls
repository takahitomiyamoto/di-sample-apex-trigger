/***********************************
 * Name: CommonConstants.cls
 * Description: Common constants
 ***********************************/
public without sharing class CommonConstants {

  // CommonErrorUtils
  public static final String DEBUG_MESSAGE_FIELDS = 'Fields: ';
  public static final String DEBUG_MESSAGE_STATUS_CODE = 'StatusCode: ';
  public static final String DEBUG_MESSAGE_MESSAGE = 'Message: ';
  public static final String DEBUG_MESSAGE_TYPE = 'Type: ';

  // CommonLogger
  public static final System.loggingLevel LOGGING_LEVEL_DEFAULT = System.LoggingLevel.DEBUG;
  public static final String DATE_FORMAT = 'yyyy-MM-dd-HH:mm:ss';
  public static final String MSG_NEW_INSTANCE_CREATED = 'New instance of CommonLogger is created.';
  public static final String PARTING_LINE = '------------------------------------------------------------';
  public static final String SYMBOL_SPACE = ' ';
  public static final String SYMBOL_CLS = '.cls';
  public static final String SYMBOL_SEMICOLON = ';';
  public static final String SYMBOL_NEWLINE = '\n';
  public static final String TIMEZONE_JST = 'Asia/Tokyo';
  public static final Integer MAX_WIDTH = 130000;

}