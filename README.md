# CUBIC slack alerts

To receive alerts via Slack you need to make a custom integration by choose incoming web hooks in your Slack team app page. You can find more details on setting up Slack integration [here](https://www.robustperception.io/using-slack-with-the-alertmanager).

Must `~/.slackhook` with the webhook URL provided by [Incoming WebHooks](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks). Then, add `qstat.sh` to your crontab at some interval:
```
*/10 * * * * /path/to/repo/qstat.sh
```