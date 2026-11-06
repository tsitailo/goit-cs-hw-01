import unittest
# Імпортуємо необхідні класи з файлу 03_interpreter.py
import importlib

interpreter_module = importlib.import_module("03_interpreter")

Lexer = interpreter_module.Lexer
Parser = interpreter_module.Parser
Interpreter = interpreter_module.Interpreter


def eval_expr(text: str):
    lexer = Lexer(text)
    parser = Parser(lexer)
    interpreter = Interpreter(parser)
    return interpreter.interpret()


class TestInterpreter(unittest.TestCase):
    def test_basic_operations(self):
        self.assertEqual(eval_expr("2 + 3"), 5)
        self.assertEqual(eval_expr("10 - 4"), 6)
        self.assertEqual(eval_expr("3 * 4"), 12)
        self.assertEqual(eval_expr("12 / 3"), 4.0)

    def test_precedence(self):
        # Перевірка пріоритету множення/ділення над додаванням/відніманням
        self.assertEqual(eval_expr("2 + 3 * 4"), 14)
        self.assertEqual(eval_expr("10 - 6 / 2"), 7.0)

    def test_parentheses(self):
        # Перевірка виразів із дужками
        self.assertEqual(eval_expr("(2 + 3) * 4"), 20)
        self.assertEqual(eval_expr("10 / (5 - 3)"), 5.0)
        self.assertEqual(eval_expr("((2 + 3) * (8 - 4)) / 2"), 10.0)


if __name__ == "__main__":
    unittest.main()
