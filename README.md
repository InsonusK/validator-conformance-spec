# validator-conformance-spec

Кросс-платформенная спецификация валидаторов в виде Gherkin/Cucumber-сценариев
([`features/`](features)). Спецификация подключается как git submodule `specs/` в
каждую реализацию и прогоняется её же тестовым раннером, чтобы подтвердить, что
реализация соответствует одному и тому же поведению независимо от языка.

- PR в `master` (при изменении `features/**`) прогоняет conformance-тесты каждой
  реализации против нового содержимого спеки — [`pr_master.yml`](.github/workflows/pr_master.yml).
- Push в `master` дополнительно собирает code coverage, mutation testing и
  публикует отчёты на GitHub Pages — [`push_master.yml`](.github/workflows/push_master.yml).

## Реализации

| Репозиторий | Язык | Тесты | Покрытие | Mutation testing |
|---|---|---|---|---|
| [validator-conformance-demo-ts](https://github.com/InsonusK/validator-conformance-demo-ts) | TypeScript | [![Tests](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/ts/tests-badge.json)](https://insonusk.github.io/validator-conformance-spec/ts/tests/) | [![Coverage](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/ts/coverage-badge.json)](https://insonusk.github.io/validator-conformance-spec/ts/coverage/) | [![Mutation score](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/ts/mutation-badge.json)](https://insonusk.github.io/validator-conformance-spec/ts/mutation/reports/mutation-report.html) |
| [validator-conformance-demo-dotnet](https://github.com/InsonusK/validator-conformance-demo-dotnet) | .NET / C# | [![Tests](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/dotnet/tests-badge.json)](https://insonusk.github.io/validator-conformance-spec/dotnet/tests/) | [![Coverage](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/dotnet/coverage-badge.json)](https://insonusk.github.io/validator-conformance-spec/dotnet/coverage/) | [![Mutation score](https://img.shields.io/endpoint?url=https://insonusk.github.io/validator-conformance-spec/dotnet/mutation-badge.json)](https://insonusk.github.io/validator-conformance-spec/dotnet/mutation/reports/mutation-report.html) |

Полные отчёты: **[insonusk.github.io/validator-conformance-spec](https://insonusk.github.io/validator-conformance-spec/)**
(пересобираются при каждом push в `master`).

## Валидаторы

- [features/amount-validator.feature](features/amount-validator.feature) — проверка суммы против баланса счёта
- [features/date-range-validator.feature](features/date-range-validator.feature) — проверка диапазона дат
- [features/email-validator.feature](features/email-validator.feature) — проверка корректности email
- [features/id-array-validator.feature](features/id-array-validator.feature) — проверка массива идентификаторов по данным контекста
