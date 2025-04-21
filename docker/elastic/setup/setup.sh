#!/usr/bin/env bash

# if [ x${ELASTIC_PASSWORD} == x ]; then
#   echo "Set the ELASTIC_PASSWORD environment variable in the .env file";
#   exit 1;
# elif [ x${KIBANA_SYSTEM_PASSWORD} == x ]; then
#   echo "Set the KIBANA_SYSTEM_PASSWORD environment variable in the .env file";
#   exit 1;
# fi;

# # if [ ! -f config/certs/ca.zip ]; then
# #   echo "Creating CA";
# #   bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip;
# #   unzip config/certs/ca.zip -d config/certs;
# # fi;

# # if [ ! -f config/certs/certs.zip ]; then
# #   echo "Creating certs";
# #   echo -ne \
# #   "instances:\n"\
# #   "  - name: es01\n"\
# #   "    dns:\n"\
# #   "      - es01\n"\
# #   "      - localhost\n"\
# #   "    ip:\n"\
# #   "      - 127.0.0.1\n"\
# #   "  - name: kibana\n"\
# #   "    dns:\n"\
# #   "      - kibana\n"\
# #   "      - localhost\n"\
# #   "    ip:\n"\
# #   "      - 127.0.0.1\n"\
# #   > config/certs/instances.yml;
# #   bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key;
# #   unzip config/certs/certs.zip -d config/certs;
# # fi;

# # echo "Setting file permissions"
# # chown -R root:root config/certs;
# # find . -type d -exec chmod 750 \{\} \;;
# # find . -type f -exec chmod 640 \{\} \;;

# echo "Waiting for Elasticsearch availability";
# until curl -s http://elasticsearch:9200;
# do
#   sleep 10;
# done;

# echo "Setting kibana_system password";
# until curl -s -X POST -u "elastic:${ELASTIC_PASSWORD}" -H "Content-Type: application/json" http://elasticsearch:9200/_security/user/kibana_system/_password -d "{\"password\":\"${KIBANA_SYSTEM_PASSWORD}\"}" | grep -q "^{}";
# do
#   sleep 10;
# done;

# echo "All done!";


#!/usr/bin/env bash



set -eu
set -o pipefail

# ==============================================================================
# Functions
# ==============================================================================


# Log a message.
function log {
	echo "[+] $1"
}

# Log a message at a sub-level.
function sublog {
	echo "   ⠿ $1"
}

# Log an error.
function err {
	echo "[x] $1" >&2
}

# Log an error at a sub-level.
function suberr {
	echo "   ⠍ $1" >&2
}

# Poll the 'elasticsearch' service until it responds with HTTP code 200.
function wait_for_elasticsearch {
	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' '-w' '%{http_code}' "http://${elasticsearch_host}:9200/" )

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1
	local output

	# retry for max 300s (60*5s)
	for _ in $(seq 1 60); do
		local -i exit_code=0
		output="$(curl "${args[@]}")" || exit_code=$?

		if ((exit_code)); then
			result=$exit_code
		fi

		if [[ "${output: -3}" -eq 200 ]]; then
			result=0
			break
		fi

		sleep 5
	done

	if ((result)) && [[ "${output: -3}" -ne 000 ]]; then
		echo -e "\n${output::-3}"
	fi

	return $result
}

# Poll the Elasticsearch users API until it returns users.
function wait_for_builtin_users {
	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' "http://${elasticsearch_host}:9200/_security/user?pretty" )

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1

	local line
	local -i exit_code
	local -i num_users

	# retry for max 30s (30*1s)
	for _ in $(seq 1 30); do
		num_users=0

		# read exits with a non-zero code if the last read input doesn't end
		# with a newline character. The printf without newline that follows the
		# curl command ensures that the final input not only contains curl's
		# exit code, but causes read to fail so we can capture the return value.
		# Ref. https://unix.stackexchange.com/a/176703/152409
		while IFS= read -r line || ! exit_code="$line"; do
			if [[ "$line" =~ _reserved.+true ]]; then
				(( num_users++ ))
			fi
		done < <(curl "${args[@]}"; printf '%s' "$?")

		if ((exit_code)); then
			result=$exit_code
		fi

		# we expect more than just the 'elastic' user in the result
		if (( num_users > 1 )); then
			result=0
			break
		fi

		sleep 1
	done

	return $result
}

# Verify that the given Elasticsearch user exists.
function check_user_exists {
	local username=$1

	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' '-w' '%{http_code}'
		"http://${elasticsearch_host}:9200/_security/user/${username}"
		)

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1
	local -i exists=0
	local output

	output="$(curl "${args[@]}")"
	if [[ "${output: -3}" -eq 200 || "${output: -3}" -eq 404 ]]; then
		result=0
	fi
	if [[ "${output: -3}" -eq 200 ]]; then
		exists=1
	fi

	if ((result)); then
		echo -e "\n${output::-3}"
	else
		echo "$exists"
	fi

	return $result
}

# Set password of a given Elasticsearch user.
function set_user_password {
	local username=$1
	local password=$2

	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' '-w' '%{http_code}'
		"http://${elasticsearch_host}:9200/_security/user/${username}/_password"
		'-X' 'POST'
		'-H' 'Content-Type: application/json'
		'-d' "{\"password\" : \"${password}\"}"
		)

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1
	local output

	output="$(curl "${args[@]}")"
	if [[ "${output: -3}" -eq 200 ]]; then
		result=0
	fi

	if ((result)); then
		echo -e "\n${output::-3}\n"
	fi

	return $result
}

# Create the given Elasticsearch user.
function create_user {
	local username=$1
	local password=$2
	local role=$3

	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' '-w' '%{http_code}'
		"http://${elasticsearch_host}:9200/_security/user/${username}"
		'-X' 'POST'
		'-H' 'Content-Type: application/json'
		'-d' "{\"password\":\"${password}\",\"roles\":[\"${role}\"]}"
		)

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1
	local output

	output="$(curl "${args[@]}")"
	if [[ "${output: -3}" -eq 200 ]]; then
		result=0
	fi

	if ((result)); then
		echo -e "\n${output::-3}\n"
	fi

	return $result
}

# Ensure that the given Elasticsearch role is up-to-date, create it if required.
function ensure_role {
	local name=$1
	local body=$2

	local elasticsearch_host="${ELASTICSEARCH_HOST:-elasticsearch}"

	local -a args=( '-s' '-D-' '-m15' '-w' '%{http_code}'
		"http://${elasticsearch_host}:9200/_security/role/${name}"
		'-X' 'POST'
		'-H' 'Content-Type: application/json'
		'-d' "$body"
		)

	if [[ -n "${ELASTIC_PASSWORD:-}" ]]; then
		args+=( '-u' "elastic:${ELASTIC_PASSWORD}" )
	fi

	local -i result=1
	local output

	output="$(curl "${args[@]}")"
	if [[ "${output: -3}" -eq 200 ]]; then
		result=0
	fi

	if ((result)); then
		echo -e "\n${output::-3}\n"
	fi

	return $result
}


# ==============================================================================
# Setup
# ==============================================================================




# --------------------------------------------------------
# Users declarations

declare -A users_passwords
users_passwords=(
	[apm_system]="${APM_SYSTEM_PASSWORD:-}"
	[beats_system]="${BEATS_SYSTEM_PASSWORD:-}"
	[kibana_system]="${KIBANA_SYSTEM_PASSWORD:-}"
	[logstash_system]="${LOGSTASH_SYSTEM_PASSWORD:-}"
	[remote_monitoring_user]="${REMOTE_MONITORING_USER_PASSWORD:-}"
)

declare -A users_roles
users_roles=(
	[logstash_system]='logstash_writer'
	[metricbeat_internal]='metricbeat_writer'
	[filebeat_internal]='filebeat_writer'
	[heartbeat_internal]='heartbeat_writer'
	[monitoring_internal]='remote_monitoring_collector'
)

# --------------------------------------------------------
# Roles declarations

declare -A roles_files
roles_files=(
	[logstash_writer]='logstash_writer.json'
	[metricbeat_writer]='metricbeat_writer.json'
	[filebeat_writer]='filebeat_writer.json'
	[heartbeat_writer]='heartbeat_writer.json'
)

# --------------------------------------------------------


log 'Waiting for availability of Elasticsearch. This can take several minutes.'

declare -i exit_code=0
wait_for_elasticsearch || exit_code=$?

if ((exit_code)); then
	case $exit_code in
		6)
			suberr 'Could not resolve host. Is Elasticsearch running?'
			;;
		7)
			suberr 'Failed to connect to host. Is Elasticsearch healthy?'
			;;
		28)
			suberr 'Timeout connecting to host. Is Elasticsearch healthy?'
			;;
		*)
			suberr "Connection to Elasticsearch failed. Exit code: ${exit_code}"
			;;
	esac

	exit $exit_code
fi

sublog 'Elasticsearch is running'

log 'Waiting for initialization of built-in users'

wait_for_builtin_users || exit_code=$?

if ((exit_code)); then
	suberr 'Timed out waiting for condition'
	exit $exit_code
fi

sublog 'Built-in users were initialized'

# for role in "${!roles_files[@]}"; do
# 	log "Role '$role'"

# 	declare body_file
# 	body_file="${BASH_SOURCE[0]%/*}/roles/${roles_files[$role]:-}"
# 	if [[ ! -f "${body_file:-}" ]]; then
# 		sublog "No role body found at '${body_file}', skipping"
# 		continue
# 	fi

# 	sublog 'Creating/updating'
# 	ensure_role "$role" "$(<"${body_file}")"
# done

for user in "${!users_passwords[@]}"; do
	log "User '$user'"
	if [[ -z "${users_passwords[$user]:-}" ]]; then
		sublog 'No password defined, skipping'
		continue
	fi

	declare -i user_exists=0
	user_exists="$(check_user_exists "$user")"

	if ((user_exists)); then
		sublog 'User exists, setting password'
		set_user_password "$user" "${users_passwords[$user]}"
	# else
	# 	if [[ -z "${users_roles[$user]:-}" ]]; then
	# 		suberr '  No role defined, skipping creation'
	# 		continue
	# 	fi

	# 	sublog 'User does not exist, creating'
	# 	create_user "$user" "${users_passwords[$user]}" "${users_roles[$user]}"
	fi
done
