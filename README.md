Must create `~/.slackuserid` with a user ID (via https://slack.com/api/users.list?token=XXXXXXXX&pretty=1) and `~/.slacktoken` with slack API token. Then, add `qstat.sh` to your crontab at some interval:
```
*/10 * * * * /path/to/repo/qstat.sh
```