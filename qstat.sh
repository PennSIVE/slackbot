#!/bin/bash

regex="<JB_job_number>(.*?)</JB_job_number>"
current_jobs=$(qstat -xml | grep -oP $regex)
completed_jobs=$(diff <(cat ~/.slackbotjobs) <(echo $current_jobs) | grep '^<' | grep JB_job_number | egrep -o "[0-9]" | tr -d "\n")
for j in $(echo $completed_jobs | fold -w7)
do
	curl -X POST "https://slack.com/api/chat.postMessage" \
	-H  "accept: application/json" \
	-H "Authorization: Bearer $(cat ~/.slacktoken)" \
	-d channel=$(cat ~/.slackuserid) -d text="Job $j completed!"
done
echo $current_jobs > ~/.slackbotjobs
