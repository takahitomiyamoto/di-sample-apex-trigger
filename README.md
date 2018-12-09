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

Basically you don't have to change any metadata under
  - ./di-sample-apex-trigger/main/common/
  - ./di-sample-apex-trigger/test/common/

![class_diagram](https://raw.githubusercontent.com/takahitomiyamoto/di-sample-apex-trigger/master/out/class_diagram_di-sample-apex-trigger.png)

## Directory Structure
```bash
.
├── LICENSE
├── README.md
├── config
│   └── project-scratch-def.json
├── di-sample-apex-trigger
│   ├── main
│   │   ├── account
│   │   │   ├── classes
│   │   │   │   ├── AccountConstants.cls
│   │   │   │   ├── AccountConstants.cls-meta.xml
│   │   │   │   ├── AccountTriggerService.cls
│   │   │   │   ├── AccountTriggerService.cls-meta.xml
│   │   │   │   ├── AccountTriggerValidation.cls
│   │   │   │   └── AccountTriggerValidation.cls-meta.xml
│   │   │   ├── customMetadata
│   │   │   │   ├── Trigger_Observer.AccountTriggerService.md-meta.xml
│   │   │   │   └── Trigger_Observer.AccountTriggerValidation.md-meta.xml
│   │   │   └── triggers
│   │   │       ├── AccountTrigger.trigger
│   │   │       └── AccountTrigger.trigger-meta.xml
│   │   └── common
│   │       ├── classes
│   │       │   ├── CommonConstants.cls
│   │       │   ├── CommonConstants.cls-meta.xml
│   │       │   ├── CommonErrorUtils.cls
│   │       │   ├── CommonErrorUtils.cls-meta.xml
│   │       │   ├── CommonLogger.cls
│   │       │   ├── CommonLogger.cls-meta.xml
│   │       │   ├── CommonTriggerHandler.cls
│   │       │   ├── CommonTriggerHandler.cls-meta.xml
│   │       │   ├── ITriggerObserver.cls
│   │       │   └── ITriggerObserver.cls-meta.xml
│   │       ├── customMetadata
│   │       │   ├── Logger.DEFAULT.md-meta.xml
│   │       │   └── Trigger_Observer.CommonTriggerObserverMock.md-meta.xml
│   │       ├── layouts
│   │       │   ├── Logger__mdt-Logger Layout.layout-meta.xml
│   │       │   └── Trigger_Observer__mdt-Trigger Observer Layout.layout-meta.xml
│   │       ├── objects
│   │       │   ├── Logger__mdt
│   │       │   │   ├── Logger__mdt.object-meta.xml
│   │       │   │   ├── fields
│   │       │   │   │   └── Logging_Level__c.field-meta.xml
│   │       │   │   └── listViews
│   │       │   │       └── All_Records.listView-meta.xml
│   │       │   └── Trigger_Observer__mdt
│   │       │       ├── Trigger_Observer__mdt.object-meta.xml
│   │       │       ├── fields
│   │       │       │   ├── Active__c.field-meta.xml
│   │       │       │   ├── After_Delete__c.field-meta.xml
│   │       │       │   ├── After_Insert__c.field-meta.xml
│   │       │       │   ├── After_Undelete__c.field-meta.xml
│   │       │       │   ├── After_Update__c.field-meta.xml
│   │       │       │   ├── Apex_Class__c.field-meta.xml
│   │       │       │   ├── Before_Delete__c.field-meta.xml
│   │       │       │   ├── Before_Insert__c.field-meta.xml
│   │       │       │   ├── Before_Update__c.field-meta.xml
│   │       │       │   ├── Object__c.field-meta.xml
│   │       │       │   └── Test_Only__c.field-meta.xml
│   │       │       └── listViews
│   │       │           └── All_Records.listView-meta.xml
│   │       └── profiles
│   │           └── Admin.profile-meta.xml
│   └── test
│       ├── account
│       │   └── classes
│       │       ├── AccountTestUtils.cls
│       │       ├── AccountTestUtils.cls-meta.xml
│       │       ├── AccountTriggerServiceTest.cls
│       │       ├── AccountTriggerServiceTest.cls-meta.xml
│       │       ├── AccountTriggerValidationTest.cls
│       │       └── AccountTriggerValidationTest.cls-meta.xml
│       └── common
│           └── classes
│               ├── CommonErrorUtilsTest.cls
│               ├── CommonErrorUtilsTest.cls-meta.xml
│               ├── CommonLoggerTest.cls
│               ├── CommonLoggerTest.cls-meta.xml
│               ├── CommonTestUtils.cls
│               ├── CommonTestUtils.cls-meta.xml
│               ├── CommonTriggerHandlerTest.cls
│               └── CommonTriggerHandlerTest.cls-meta.xml
├── manifest
│   └── package.xml
├── orgConvert.sh
├── orgInit.sh
├── out
│   └── class_diagram_di-sample-apex-trigger.png
└── sfdx-project.json
```

## Acknowledgement
- Custom Metadata Type: [Build Reusable Lightning Components](https://trailhead.salesforce.com/content/learn/projects/build-reusable-lightning-components)
- Apex Trigger Pattern: [takahiro-yonei/ApexTriggerForMeetup18](https://github.com/takahiro-yonei/ApexTriggerForMeetup18)
