# Анализ Def-Use цепочек

Переменная: log_entry
Def 1: строка 2 (log_entry = "Start processing")
Def 2: строка 8 (log_entry = "Transaction finished...")
Use: строка 10 (file.write(log_entry))

Переменная: status
Def: строка 4 (status = "approved")
Use: строка 8 (конкатенация строк), строка 11 (return status)

Переменная: balance
Def: строка 5 (balance = get_balance(user_id))
Use: строка 6 (new_balance = balance - amount)

Переменная: new_balance
Def: строка 6 (new_balance = balance - amount)
Use: строка 7 (update_balance(user_id, new_balance))

Переменная: file
Def: строка 9 (file = open(...))
Use: строка 10 (file.write(...))
