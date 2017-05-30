#!/bin/bash
#this monster... well, jenkins slave was dropping connection and after few reconnects it was shuting down entriley
#as a temporary solution I added this script running in the backgroud to hard reset the slave
#...  
#stop judging!

pathToLogs="/Users/uk_room1/jenkins"
pathToJenkinsLog="${pathToLogs}/errorLogs"
START="java -jar slave.jar -jnlpUrl http://212.129.29.180:8080/jenkins/computer/London_conference_room/slave-agent.jnlp -secret e7d59b22a58102ca0af72fecf6a4d178179fd^Ca844797f646978473784e0e6f &"
conditionOfReboot="tail -1 ${pathToJenkinsLog} | grep \"Restarting agent via jenkins.slaves.restarter\""

eval $START >> pathToJenkinsLog 2>&1

while [ 1 ]
do
	echo "=====Started script====="
	if [[ $(eval $conditionOfReboot) ]];	then
		echo "=====Slave agent is reconnecting====="
		sleep 5
		if [[ $(eval $conditionOfReboot) ]];	then
			echo "=====Slave failed to reconnect. Restarting...====="
			kill $(ps -ax | grep slave.jar | grep -v grep | awk '{print $1}')
			eval $START >> pathToJenkinsLog 2>&1
			echo "=====Restarted====="
		fi
	fi
sleep 5
done