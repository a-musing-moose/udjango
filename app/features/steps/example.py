from behave import given, then, when


@given('we have behave installed')
def behave_installed(context):
    pass


@when('we implement a test')
def test_implemented(context):
    assert True is not False


@then('behave will test it for us!')
def test_did_not_fail(context):
    assert context.failed is False


@when("we don't implement a test")
def noop(context):
    pass
