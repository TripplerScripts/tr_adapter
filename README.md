# tr_adapter

The AS YOU WISH script is a resource that allows you to use any FiveM resource without any other FiveM resource dependency. 

we can expect a lot of bug with this adapter, such as side effects
we label and provide our compatibilities based on the functionality of the function

functionX {
  labels = _SAME_ | _DIFFERENT_, ✅ supported
  params = {
    methods = _SAME_ | _DIFFERENT_,   -- how params are passed (by name, by index, etc.)
    values  = _SAME_ | _DIFFERENT_,   -- actual values passed
    count   = _SAME_ | _DIFFERENT_,   -- number of params
    types   = _SAME_ | _DIFFERENT_,   -- type differences (number, string, table, etc.)
    order   = _SAME_ | _DIFFERENT_,   -- param order
  },
  returnals = {
    methods = _SAME_ | _DIFFERENT_,   -- how results are returned (direct, table, multiple values)
    values  = _SAME_ | _DIFFERENT_,   -- actual returned values
    count   = _SAME_ | _DIFFERENT_,   -- number of return values
    types   = _SAME_ | _DIFFERENT_,   -- type differences
    order   = _SAME_ | _DIFFERENT_,   -- order of multi-returns
  },
  errorHandling = _SAME_ | _DIFFERENT_, -- returns nil vs throws error
}

add_ace resource.tr_adapter command.quit allow