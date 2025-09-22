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

--[[ param

{
  name = "param", needed by ox and ps
  type = "string", needed by qb
  default = "default", needed by qb and ox
  optional = true, needed by qb and ox and ps
  description = "description", needed by ps
}

return {
  name = "return", to be returned to the script that called qb and ox
  type = "string", to be returned to the script that called ps and ox
  default = "default", to be returned to the script that called qb
  optional = true, to be returned to the script that called qb and ox
  description = "description", to be returned to the script that called qb and ox
}


ox param {
  name = 'standard.param.name',
  default = 'standard.param.defaulttype',
  optional = 'standard.param.optional',
}

ox return {
  name = 'standard.return.name',
  type = 'standard.return.type',
  optional = 'standard.return.optional',
  description = 'standard.return.description',
}

qb param {
  ..............
}

so its like a shop 
if i have qb

and a script call ox
with ox param (ofc)
the adapter intercept, store it in the starndard param, then look for what script i have in server (qb) and fill the strandard return from the qb,
if qb doesnt have all requirements (which what we faced), for now we'll just fill it with some default values (experimantal) and return it to the script that called ox
and like this way we will be able to fake the function and make it work



 ]]