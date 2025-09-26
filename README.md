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
    order   = _SAME_ | _DIFFERENT_,   -- param order ||| ❌ not yet
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

before the call
mapping(...)
  local type = {...}.type
  local availableScript = 'qb-inventory'
  local target = availableScript[type]
 qb-inventory.getcharacter(identifier)
  ['name'] = exports['qb-inventory']:GetPlayerSteamByName(name)
  ['steam'] = exports['qb-inventory']:GetPlayerSteamByIdentifier(identifier)

 ps-inventory.getped(steam)
    ['name'] = exports['ps-inventory']:GetPlayerNameBySteam(steam)
    ['identifier'] = exports['ps-inventory']:GetPlayerIdentifierBySteam(steam)

 ox_inventory.getplayer(name)
    ['identifier'] = exports['ox_inventory']:GetPlayerIdentifierByName(name)
    ['steam'] = exports['ox_inventory']:GetPlayerNameByIdentifier(identifier)

basicaly every function that is inside a function we be used based on the script we have

scenario
tr_patrol: ox_inventory.getplayer:(name)

tr_adapter intercept and redirect to a local function, search in the functions i have, and go inside the ?script to find the function GetPlayer(name)

now we can set GetPlayer(name)
mapping(name(getplayernidentifierbyname))

then we can set GetPlayer(identifier)
mapping(identifier(getplayernamebyidentifier))
and the function will return the player

now the return values

we have to draw a return values based on the script we have


we need the expectation for each script

currentAvaialableScript this is depends on every server and its scripts so its not const
mapping = {
  name = exports.currentAvaialableScript:getplayername(),
  age = exports.currentAvaialableScript:getplayerage(),
  nationality = exports.currentAvaialableScript:getplayernationality(),
  items = {
    {
      name = exports.currentAvaialableScript:getplayeritemname(),
      amount = exports.currentAvaialableScript:getplayeritemamount(),
    }
  },
  bank = exports.currentAvaialableScript:getplayerbank(),
  phone = exports.currentAvaialableScript:getplayerphone(),
  height = exports.currentAvaialableScript:getplayerheight(),
  blood = exports.currentAvaialableScript:getplayerblood(),
  dob = exports.currentAvaialableScript:getplayerdob(),
}

['qb-inventory'] = {
  ['getcharacter'] = {
    ['expect'] = { we cant put default since its an array
      'name', 'age', 'nationality'
    }
    ['data'] = {
      expect.name = mapping.name,
      expect.age = mapping.age,
      expect.nationality = mapping.nationality,
    }
  }
}

['ps-inventory'] = {
  ['getped'] = {
    ['expect'] = {
      items = {
        {
          name = 'string',
          amount = 'number',
        }
      }
      charinfo = {
        name = 'string',
        bank = 'number',
        phone = 'string',
      }
    },
    ['data'] = {
      expect.items = mapping.items,
      expect.charinfo = {
        name = mapping.name,
        bank = mapping.bank,
        phone = mapping.phone,
      }
    }
  }
}

['ox_inventory'] = {
  ['getplayer'] = {
    ['expect'] = {
      height = 'number',
      blood = 'string',
      dob = 'string',
    },
    ['data'] = {
      expect.height = mapping.height,
      expect.blood = mapping.blood,
      expect.dob = mapping.dob,
    }
  }
}







standard.GetPlayerId = function(source, name)
  return exports['currentAvaialableScript']:depends on the current one(source, name)
end

['qb-inventory'].GetPlayerIdentity = {
  ['source'] = standard.GetPlayerId.source,
  ['name'] = standard.GetPlayerId.name,
}
['ps-inventory'].getplayeridentity = {
  {
    ['name'] = standard.GetPlayerId.name,
    ['source'] = standard.GetPlayerId.source,
  }
}
['ox_inventory'].getplayerIdentifier = {
  ['name'] = standard.GetPlayerId.name,
  ['source'] = standard.GetPlayerId.source,
}

missorder scenario
tr_patrol: ox_inventory:getplayerIdentifier(name, source)

the adapter will intercept, store the identity (which is ox_inventory) this call and redirect to local function
and somehow he will manage go to ['ox_inventory'].getplayerIdentifier and grab right order
like
the adapter does do and say
who is that?
its says
getplayerIdentifier from ox_inventory
then
oh you r the guys who has this order name, source right? ok hold on a sec
then look for what i have in the server
i have qb-inventory
and qb-inventory has GetPlayerIdentity with this order {source, name}
so we have two option
either create a new var so we can switch vars with eaach other 
or
make every var point to the right order (preferred)

then simply use standard.GetPLayerId(source, name) with the filtered args

the return value make it the original since we are focusing on the params first
