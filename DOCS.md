# Documentation
## Classes
### gt67r4 (`local gt67r4 = require("gt67r4") `)
| Method | Args  | Description  | Example |
| ------------ | ------------ | ------------ | ------------ |
|  SetBackend | backend: table  |  Sets the backend | `gt67r4:SetBackend(require("backends.luasocket"))` |
|  Client | token: string  |  Returns client class object | `local client = gt67r4:Client("Bot <insert_your_token>")` |
### client
| Method | Args  
| ------------ | ------------ |
|  constructor() | json: table, backend: table, token: string |

And a lot of other, from Discordia API class.