class @Debt extends MiniModel
  @collectionName: "Debts"
  @validations: [
    {descr: ['minLength', 5]},
    {descr:
      rule:     ['maxLength', 50]
      message:  'Title can not be longer than 50 chars'
    },
    {debt: 'notEmpty'},
    {debt:
      rule: (field) ->
        return false if field < 0
        return true;
      message:  'All debts should be positive'
    }
  ]
  @beforeSave: [
    (todo) ->
      todo.beforeData = "before"
    (todo) ->
      todo.beforeData2 = "before2"
  ]
  @afterSave: [
    (todo) ->
      todo.afterData = "after"
  ]