Feature: showing off behave

    Scenario: run a simple test
        Given we have behave installed
        When we implement a test
        Then behave will test it for us!

    Scenario: fail an unimplemented simple test
        Given we have behave installed
        When we don't implement a test
        Then fails because this step is not implemented
