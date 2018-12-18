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
      | Course 2 | C2        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
      | teacher1 | C2     | editingteacher |
    And the following config values are set as admin:
      | config      | value           | plugin        |
      | apiurl      | 172.17.0.1:8080 | tool_opencast |
      | apipassword | opencast        | tool_opencast |
      | apiusername | admin           | tool_opencast |
#    And the following "series exist on opencast:
#      | series | uid                                  |
#      | S1     | f372754a-9a8b-4dea-b717-e08880a2e3cb |
#    And the following "videos" exist on opencast:
#      | title        | series |
#      | video1_1.mp4 | S1     |
#      | video1_2.mp4 | S1     |
    And I log in as "admin"
    And I am on "Course 1" course homepage with editing mode on
    And I add the "Opencast Videos" block
    And I click on "Go to overview..." "link"

  Scenario: The Opencast change Series mapping
    When I click on "Edit series mapping" "button"
    And I set the field "seriesid" to "f372754a-9a8b-4dea-b717-e08880a2e3cb"
    And I click on "Save changes" "button"
    Then I should see "video1_1.mp4"
    And I should see "video1_2.mp4"

    