### URL
`https://s3-eu-west-1.amazonaws.com/twa-game-data.twaservers.com/{TRIGGERS_SSE}`

### Method
`GET`

### Sample request
`https://s3-eu-west-1.amazonaws.com/twa-game-data.twaservers.com/rules/wgpqa/triggers/sse.json.TWA_BONUS_10-13_Aug_30650_PROD`

### Sample response

```json
[{
	"effects": [{
		"bonus": "free_xp_cents",
		"type": "mult",
		"value": 2
	}, {
		"bonus": "unit_xp_cents",
		"type": "mult",
		"value": 2
	}],
	"trigger": "first_daily_victory",
	"valid_from": 1533895200,
	"valid_to": 1534154400
}]
```
