
UPDATE act_dmn_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = '2019-03-13 21:23:26.171' WHERE ID = 1 AND LOCKED = FALSE;

CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ VARCHAR(255) NOT NULL, DECISION_DEFINITION_ID_ VARCHAR(255), DEPLOYMENT_ID_ VARCHAR(255), START_TIME_ TIMESTAMP WITHOUT TIME ZONE, END_TIME_ TIMESTAMP WITHOUT TIME ZONE, INSTANCE_ID_ VARCHAR(255), EXECUTION_ID_ VARCHAR(255), ACTIVITY_ID_ VARCHAR(255), FAILED_ BOOLEAN DEFAULT FALSE, TENANT_ID_ VARCHAR(255), EXECUTION_JSON_ TEXT, CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_));

INSERT INTO act_dmn_databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 2, '7:15a6bda1fce898a58e04fe6ac2d89f54', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2508606726');

UPDATE act_dmn_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

