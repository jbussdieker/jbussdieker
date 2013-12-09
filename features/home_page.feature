Feature: Home page

  Scenario: Viewing application's home page
    Given there's a railscast titled "Caching with Instance Variables" that is watched
    When I am on the homepage
    Then I should see the "Caching with Instance Variables" railscast with "Watched" content
