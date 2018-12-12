@block @block_opencast
Feature: Add Opencast block as Teacher
  Overview and Add video / Edit upload tasks Page exists

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                | idnumber |
      | teacher1 | Teacher   | 1        | teacher1@example.com | T1       |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
    And I log in as "teacher1"
    And I am on "Course 1" course homepage with editing mode on
    And I add the "Opencast Videos" block

  Scenario: The Opencast Videos block is Added
    Then I should see "No videos available"

  Scenario: Opencast Overview page implemented
    When I click on "Go to overview..." "link"
    Then I should see "Videos currently being uploaded to the streaming server"

  Scenario: Opencast Add video / Eiit upload tasks page implemented
    Given I click on "Go to overview..." "link"
    When I click on "Add video / Edit upload tasks" "button"
    Then I should see "You can drag and drop files here to add them."

  @_file_upload
  Scenario: Opencast äöü
    Given I click on "Go to overview..." "link"
    And I click on "Add video / Edit upload tasks" "button"
    And I upload "blocks/opencast/tests/file/test.mp4" file to "Videos to upload to opencast" filemanager




