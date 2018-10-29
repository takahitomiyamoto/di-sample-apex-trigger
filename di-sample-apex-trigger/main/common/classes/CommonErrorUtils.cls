/***********************************
 * Name: CommonErrorUtils.cls
 * Description: Utilities for Error
 ***********************************/
public without sharing class CommonErrorUtils {

  // Constants
  private static final String SYMBOL_NEWLINE = CommonConstants.SYMBOL_NEWLINE;
  private static final String DEBUG_MESSAGE_FIELDS = CommonConstants.DEBUG_MESSAGE_FIELDS;
  private static final String DEBUG_MESSAGE_STATUS_CODE = CommonConstants.DEBUG_MESSAGE_STATUS_CODE;
  private static final String DEBUG_MESSAGE_MESSAGE = CommonConstants.DEBUG_MESSAGE_MESSAGE;
  private static final String DEBUG_MESSAGE_TYPE = CommonConstants.DEBUG_MESSAGE_TYPE;

  // Class Variables
  private static String methodName;

  /************************************************************
   * Name: createErrorMessage
   * Description: Create Error Message from Database.Error
   *
   * @param  Database.Error error
   * @return String
   ************************************************************/
  public static String createErrorMessage(Database.Error error) {
    methodName = 'createErrorMessage';

    String errorMessage = '' +
      DEBUG_MESSAGE_FIELDS + error.getFields() + SYMBOL_NEWLINE +
      DEBUG_MESSAGE_STATUS_CODE + error.getStatusCode() + SYMBOL_NEWLINE +
      DEBUG_MESSAGE_MESSAGE + error.getMessage() + SYMBOL_NEWLINE;

    return errorMessage;
  }

  /*******************************************************
   * Name: createErrorMessage
   * Description: Create Error Message from Exception
   *
   * @param  Exception e
   * @return String
   *******************************************************/
  public static String createErrorMessage(Exception e) {
    methodName = 'createErrorMessage';

    String errorMessage = '' +
      DEBUG_MESSAGE_TYPE + e.getTypeName() + SYMBOL_NEWLINE +
      DEBUG_MESSAGE_MESSAGE + e.getMessage() + SYMBOL_NEWLINE;

    return errorMessage;
  }

}