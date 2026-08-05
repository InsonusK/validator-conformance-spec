Feature: Проверка корректности email

  Scenario Outline: email проверяется на корректность
    When проверяется email "<email>"
    Then результат валидности: <valid>
    And список ошибок: "<errors>"

    Examples:
      | description                               | email                    | valid | errors               |
      | простой корректный email                  | user@example.com         | true  |                      |
      | корректный email с тегом и точкой в имени | user.name+tag@example.co | true  |                      |
      | корректный email с поддоменом             | user@sub.example.com     | true  |                      |
      | регистр символов не влияет на валидность  | USER@EXAMPLE.COM         | true  |                      |
      | пустое значение                           |                          | false | email_required       |
      | отсутствует символ "@"                    | userexample.com          | false | invalid_email_format |
      | отсутствует домен после "@"               | user@                    | false | invalid_email_format |
      | отсутствует локальная часть до "@"        | @example.com             | false | invalid_email_format |
      | два символа "@" подряд                    | user@@example.com        | false | invalid_email_format |
      | пробел внутри email                       | user @example.com        | false | invalid_email_format |
      | отсутствует TLD (домен верхнего уровня)   | user@example             | false | invalid_email_format |
      | домен начинается с точки                  | user@.com                | false | invalid_email_format |
      | две точки подряд в домене                 | user@example..com        | false | invalid_email_format |
