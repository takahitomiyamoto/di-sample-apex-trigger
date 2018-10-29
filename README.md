# Dependency Injection Sample for Apex Trigger

## How to Use
- [Enable DevHub](https://developer.salesforce.com/docs/atlas.ja-jp.sfdx_setup.meta/sfdx_setup/sfdx_setup_enable_devhub.htm)
- [Install Salesforce CLI](https://developer.salesforce.com/docs/atlas.ja-jp.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm#sfdx_setup_install_cli)
- [Install VS Code](https://developer.salesforce.com/ja/tools/extension_vscode)

```bash
git clone https://github.com/takahitomiyamoto/di-sample-apex-trigger.git
cd di-sample-apex-trigger
code .

sudo chmod +x ./orgInit.sh  # if needed.

./orgInit.sh
```

## Directory Structure
```bash
.
├── LICENSE
├── README.md
├── config
│   └── project-scratch-def.json
├── di-sample-apex-trigger
│   ├── main
│   │   ├── account
│   │   │   ├── classes
│   │   │   │   ├── AccountConstants.cls
│   │   │   │   ├── AccountConstants.cls-meta.xml
│   │   │   │   ├── AccountTriggerHandler.cls
│   │   │   │   ├── AccountTriggerHandler.cls-meta.xml
│   │   │   │   ├── AccountTriggerService.cls
│   │   │   │   ├── AccountTriggerService.cls-meta.xml
│   │   │   │   ├── AccountTriggerValidation.cls
│   │   │   │   └── AccountTriggerValidation.cls-meta.xml
│   │   │   └── triggers
│   │   │       ├── AccountTrigger.trigger
│   │   │       └── AccountTrigger.trigger-meta.xml
│   │   ├── common
│   │   │   ├── classes
│   │   │   │   ├── BaseTriggerHandler.cls
│   │   │   │   ├── BaseTriggerHandler.cls-meta.xml
│   │   │   │   ├── CommonConstants.cls
│   │   │   │   ├── CommonConstants.cls-meta.xml
│   │   │   │   ├── CommonErrorUtils.cls
│   │   │   │   ├── CommonErrorUtils.cls-meta.xml
│   │   │   │   ├── CommonLogger.cls
│   │   │   │   ├── CommonLogger.cls-meta.xml
│   │   │   │   ├── ITriggerObserver.cls
│   │   │   │   └── ITriggerObserver.cls-meta.xml
│   │   │   ├── customMetadata
│   │   │   │   ├── Trigger_Observer.TR001.md-meta.xml
│   │   │   │   ├── Trigger_Observer.TR002.md-meta.xml
│   │   │   │   ├── Trigger_Observer.TR003.md-meta.xml
│   │   │   │   └── Trigger_Observer.TR004.md-meta.xml
│   │   │   ├── layouts
│   │   │   │   └── Trigger_Observer__mdt-Trigger\ Observer\ Layout.layout-meta.xml
│   │   │   ├── objects
│   │   │   │   └── Trigger_Observer__mdt
│   │   │   │       ├── Trigger_Observer__mdt.object-meta.xml
│   │   │   │       ├── fields
│   │   │   │       │   ├── Active__c.field-meta.xml
│   │   │   │       │   ├── After_Delete__c.field-meta.xml
│   │   │   │       │   ├── After_Insert__c.field-meta.xml
│   │   │   │       │   ├── After_Undelete__c.field-meta.xml
│   │   │   │       │   ├── After_Update__c.field-meta.xml
│   │   │   │       │   ├── Apex_Class__c.field-meta.xml
│   │   │   │       │   ├── Before_Delete__c.field-meta.xml
│   │   │   │       │   ├── Before_Insert__c.field-meta.xml
│   │   │   │       │   ├── Before_Update__c.field-meta.xml
│   │   │   │       │   ├── Object__c.field-meta.xml
│   │   │   │       │   └── Test_Only__c.field-meta.xml
│   │   │   │       └── listViews
│   │   │   │           └── All.listView-meta.xml
│   │   │   └── profiles
│   │   │       └── Admin.profile-meta.xml
│   │   └── default
│   └── test
│       ├── account
│       │   └── classes
│       │       ├── AccountTestUtils.cls
│       │       ├── AccountTestUtils.cls-meta.xml
│       │       ├── AccountTriggerHandlerTest.cls
│       │       ├── AccountTriggerHandlerTest.cls-meta.xml
│       │       ├── AccountTriggerServiceTest.cls
│       │       ├── AccountTriggerServiceTest.cls-meta.xml
│       │       ├── AccountTriggerValidationTest.cls
│       │       └── AccountTriggerValidationTest.cls-meta.xml
│       └── common
│           └── classes
│               ├── CommonErrorUtilsTest.cls
│               ├── CommonErrorUtilsTest.cls-meta.xml
│               ├── CommonLoggerTest.cls
│               └── CommonLoggerTest.cls-meta.xml
└── sfdx-project.json
```

## Acknowledgement
- [afawcett/force-di](https://github.com/afawcett/force-di)
- [Crafting Flexible APIs in Apex Using Custom Metadata](https://success.salesforce.com/sessions?eventId=a1Q3A00001XoCSUUA3#/session/a2q3A000001WXFFQA4)
- [takahiro-yonei/ApexTriggerForMeetup18](https://github.com/takahiro-yonei/ApexTriggerForMeetup18)
