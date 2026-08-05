Feature: Проверка диапазона дат "Дата С" — "Дата По"
  # Даты передаются в формате YYYY-MM-DD. Диапазон корректен, если "Дата С" <= "Дата По".
  # Пустая ячейка в колонке dateFrom/dateTo означает, что значение не передано.

  Scenario Outline: диапазон дат проверяется на корректность
    When проверяется диапазон с датой "<dateFrom>" по дату "<dateTo>"
    Then результат валидности: <valid>
    And список ошибок: "<errors>"

    Examples:
      | description                          | dateFrom   | dateTo     | valid | errors                              |
      | Дата С раньше Дата По — валидно      | 2026-01-01 | 2026-01-31 | true  |                                     |
      | Дата С равна Дата По — валидно       | 2026-01-01 | 2026-01-01 | true  |                                     |
      | Дата С позже Дата По — невалидно     | 2026-02-01 | 2026-01-01 | false | date_from_after_date_to             |
      | не передана Дата С                   |            | 2026-01-01 | false | date_from_required                  |
      | не передана Дата По                  | 2026-01-01 |            | false | date_to_required                    |
      | не переданы обе даты                 |            |            | false | date_from_required,date_to_required |
      | Дата С в неподдерживаемом формате    | 01/01/2026 | 2026-01-31 | false | invalid_date_format                 |
      | Дата С содержит несуществующий месяц | 2026-13-01 | 2026-01-31 | false | invalid_date_format                 |
      | Дата С не является датой             | not-a-date | 2026-01-31 | false | invalid_date_format                 |
