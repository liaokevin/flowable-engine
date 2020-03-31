
CREATE TABLE ACT_FO_DATABASECHANGELOGLOCK (ID INTEGER NOT NULL, LOCKED SMALLINT NOT NULL, LOCKGRANTED TIMESTAMP, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DBCHGLOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_FO_DATABASECHANGELOGLOCK;

INSERT INTO ACT_FO_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = TIMESTAMP('2020-01-22 08:32:40.249') WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_FO_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP NOT NULL, ORDEREXECUTED INTEGER NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255), DEPLOYMENT_ID VARCHAR(10));

CREATE TABLE ACT_FO_FORM_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOY_TIME_ TIMESTAMP, TENANT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), CONSTRAINT PK_ACT_FO_FORM_DE PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), RESOURCE_BYTES_ BLOB, CONSTRAINT PK_ACT_FO_FORM_RE PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255), VERSION_ INTEGER, KEY_ VARCHAR(255), CATEGORY_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), PARENT_DEPLOYMENT_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), RESOURCE_NAME_ VARCHAR(255), DESCRIPTION_ VARCHAR(255), CONSTRAINT PK_ACT_FO_FORM_DE PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_INSTANCE (ID_ VARCHAR(255) NOT NULL, FORM_DEFINITION_ID_ VARCHAR(255) NOT NULL, TASK_ID_ VARCHAR(255), PROC_INST_ID_ VARCHAR(255), PROC_DEF_ID_ VARCHAR(255), SUBMITTED_DATE_ TIMESTAMP, SUBMITTED_BY_ VARCHAR(255), FORM_VALUES_ID_ VARCHAR(255), TENANT_ID_ VARCHAR(255), CONSTRAINT PK_ACT_FO_FORM_IN PRIMARY KEY (ID_));

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', CURRENT TIMESTAMP, 1, '7:252bd5cb28cf86685ed67eb15d910118', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '9678360339');

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ VARCHAR(255);

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_TYPE_ VARCHAR(255);

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_DEFINITION_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_FO_FORM_INSTANCE');

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', CURRENT TIMESTAMP, 2, '7:4850f9311e7503d7ea30a372e79b4ea2', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '9678360339');

ALTER TABLE ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_FO_FORM_DEFINITION');

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', CURRENT TIMESTAMP, 3, '7:6d80a1fd28201ae354e73bd7c5cf8595', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '9678360339');

CREATE UNIQUE INDEX ACT_IDX_FORM_DEF_UNIQ ON ACT_FO_FORM_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', CURRENT TIMESTAMP, 4, '7:80b47424c1d564a692fc8923633f78e4', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '9678360339');

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

