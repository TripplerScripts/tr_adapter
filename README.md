# tr_adapter

The AS YOU WISH script is a resource that allows you to use any FiveM resource without any other FiveM resource dependency. 

we can expect a lot of bug with this adapter, such as side effects
we label and provide our compatibilities based on the functionality of the function

functionX {
  labels = _SAME_ | _DIFFERENT_, ✅ supported
  params = {
    values  = _SAME_ | _DIFFERENT_,   -- actual values passed ||| ✅ supported (this is values not type of values)
    count   = _SAME_ | _DIFFERENT_,   -- number of params ||| ✅ ignored since it wont effect the result or the grabber orr arguments
    types   = _SAME_ | _DIFFERENT_,   -- type differences (number, string, table, etc.) ||| ❌ not yet
    order   = _SAME_ | _DIFFERENT_,   -- param order ||| ✅ supported
  },
  returnals = {
    values  = _SAME_ | _DIFFERENT_,   -- actual returned values ||| ✅ supported
    types   = _SAME_ | _DIFFERENT_,   -- type differences ||| ❌ not yet
    order   = _SAME_ | _DIFFERENT_,   -- order of multi-returns ||| ❌ untested
  },
  errorHandling = _SAME_ | _DIFFERENT_, -- returns nil vs throws error ||| ❌ not yet
}