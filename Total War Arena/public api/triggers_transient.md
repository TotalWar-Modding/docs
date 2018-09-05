### URL
`https://s3-eu-west-1.amazonaws.com/twa-game-data.twaservers.com/{TRIGGERS_TRANSIENT}`

### Method
`GET`

### Sample request
`https://s3-eu-west-1.amazonaws.com/twa-game-data.twaservers.com/rules/live/triggers/transient.json.E253829BA2B715F93207F0C72A8B74AF`

### Sample response

```json
[{
	"valid_from": 1533286800,
	"valid_to": 1533895200,
	"trigger": "single_use_activity_trigger",
	"effects": [{
		"bonus": "free_xp_cents",
		"value": 10000000,
		"type": "add"
	}]
}]
```
