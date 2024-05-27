@openshift-serverless-1/logic-data-index-postgresql-rhel8
Feature: logic-data-index-postgresql postgresql feature.

  Scenario: verify if all labels are correctly set on logic-data-index-postgresql image
    Given image is built
     Then the image should contain label maintainer with value serverless-logic <bsig-cloud@redhat.com>
      And the image should contain label io.openshift.expose-services with value 8080:http
      And the image should contain label io.k8s.description with value Red Hat build of Runtime image for Kogito Data Index Service for PostgreSQL persistence provider
      And the image should contain label io.k8s.display-name with value Red Hat build of Kogito Data Index Service - PostgreSQL
      And the image should contain label io.openshift.tags with value logic-data-index,kogito,data-index,data-index-postgresql

  Scenario: check if the default quarkus profile is correctly set on data index
    When container is started with env
      | variable               | value   |
      | SCRIPT_DEBUG           | true    |
    Then container log should contain -Dquarkus.profile=kafka-events-support