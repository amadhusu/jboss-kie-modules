@rhdm-7/rhdm-controller-rhel8
Feature: RHDM Controller configuration tests

  # https://issues.jboss.org/browse/CLOUD-180
  Scenario: Check if image version and release is printed on boot
    When container is ready
    Then container log should contain rhdm-7/rhdm-controller-rhel8 image, version

  Scenario: Check for product and version environment variables
    When container is started with command bash
    Then run sh -c 'echo $JBOSS_PRODUCT' in container and check its output for rhdm-controller
     And run sh -c 'echo $RHDM_CONTROLLER_VERSION' in container and check its output for 7.13
