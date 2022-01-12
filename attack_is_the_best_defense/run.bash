#!/usr/bin/env bash
# Dictionary pentesting routines
DOCKER_CONT_ID=''
PWD_LIST_SOURCES=()
PWD_LIST_FILES=()
PWDS_FILE='pwds.txt'
ATTACK_FILE='attack.bash'

if [ "$(docker ps | grep -c 'sylvainkalache/264-1')" -le 0 ]; then
	docker run -p 2222:22 -d -ti sylvainkalache/264-1
fi
DOCKER_CONT_ID=$(docker ps | grep 'sylvainkalache/264-1' | cut -d ' ' -f1)

# Sets up the pentesting process
pt_setup() {
	[ -d pwd_dicts ] || mkdir pwd_dicts
	readarray -t PWD_LIST_SOURCES < <([ -f 'sources.txt' ] && cat 'sources.txt')
	n="${#PWD_LIST_SOURCES[@]}"
	for ((i = 0; i < "$n"; i++)) do
		dest_file='pwd_dicts/'$(echo "${PWD_LIST_SOURCES[i]}" | cut -d '/' -f4-)
		if [[ -f "$dest_file" ]]; then
			if [[ "$(echo "$dest_file" | grep -oE 'bz2$')" == 'bz2' ]]; then
				bzip2 -dkq "$dest_file"
			fi
			echo -e "\e[33m[$((i + 1))/$n]\e[0m: $dest_file Exists"
		else
			echo -e "\e[33m[$((i + 1))/$n]\e[0m: Downloading $dest_file"
			wget -q -x -nH -P pwd_dicts "${PWD_LIST_SOURCES[i]}"
			if [[ "$(echo "$dest_file" | grep -oE 'bz2$')" == 'bz2' ]]; then
				bzip2 -dkq "$dest_file"
			fi
		fi
	done
	readarray -t PWD_LIST_FILES < <(find pwd_dicts -type f | grep -oE '^.*\.txt$')
	if [ "${#PWD_LIST_FILES[@]}" -gt 0 ]; then
		if [[ -f "$PWDS_FILE" ]]; then
			echo -e "Passwords have been curated"
		else
			cat "${PWD_LIST_FILES[@]}" | grep -oE '.{11}' | \
				grep -Ev '^[[:space:]]*$' | uniq > $PWDS_FILE
		fi
	fi
	docker cp "$PWDS_FILE" "$DOCKER_CONT_ID:/root/$PWDS_FILE"
	docker exec -i "$DOCKER_CONT_ID" /bin/bash -c \
		'which hydra && exit; apt-get update; apt-get -qy install hydra'
	docker cp "$ATTACK_FILE" "$DOCKER_CONT_ID:/root/$ATTACK_FILE"
}

# Runs the pentesting attack
pt_attack() {
	docker -D exec -i "$DOCKER_CONT_ID" \
		/bin/bash -c '/root/'"$ATTACK_FILE"
}

# Resumes a pentesting attack session
pt_resume_attack() {
	docker exec -i "$DOCKER_CONT_ID" /bin/bash -c 'hydra -R'
}

if [[ "$1" == 'setup' ]]; then
	pt_setup
elif [[ "$1" == 'attack' ]]; then
	pt_attack
elif [[ "$1" == 'resume_attack' ]]; then
	pt_resume_attack
else
	echo -e 'Nothing to run'
fi
