#!/bin/bash

current_jobs=$(qstat -xml | grep JB_job_number | grep -Eo "[0-9]*")
last_jobs=$(cat ~/.slackbotjobs)
endpoint=$(cat ~/.slackhook)
for j in $last_jobs; do
	echo $current_jobs | grep $j >/dev/null
	if [ $? != 0 ]; then # job in last_jobs but not current_jobs; must've finished!
		curl -X POST --data-urlencode "payload={\"username\": \"CUBIC\", \"text\": \"Job $j completed\", \"icon_emoji\": \":ghost:\"}" $endpoint
	fi
done
printf "" >~/.slackbotjobs
for j in $current_jobs; do echo $j >>~/.slackbotjobs; done
