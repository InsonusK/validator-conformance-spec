Feature: Проверка суммы против баланса счёта

  Scenario Outline: сумма проверяется относительно баланса
    Given баланс счёта "<accountId>" равен <balance>
    When проверяется сумма <amount> для счёта "<accountId>"
    Then результат валидности: <valid>
    And список ошибок: "<errors>"

    Examples:
      | description                                 | accountId | balance | amount | valid | errors                  |
      | сумма меньше баланса — валидно              | acc-1     |     300 |    100 | true  |                         |
      | сумма больше баланса — недостаточно средств | acc-1     |     300 |    500 | false | insufficient_funds      |
      | сумма равна балансу — валидно               | acc-1     |     300 |    300 | true  |                         |
      | нулевая сумма — невалидно                   | acc-1     |     300 |      0 | false | amount_must_be_positive |
      | отрицательная сумма — невалидно             | acc-1     |     300 |    -10 | false | amount_must_be_positive |
