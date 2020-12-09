class TestModule:
    def tests(self):
        return {
            'test_user': lambda i: 'password_hash' not in i
        }
