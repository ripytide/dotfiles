#!/bin/bash
# ARG_POSITIONAL_SINGLE([heading],[],[])
# ARG_POSITIONAL_SINGLE([body],[],["then"])
# ARG_OPTIONAL_SINGLE([urgency],[u],[],[normal])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='u'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_body="then"
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_urgency="normal"


print_help()
{
	printf 'Usage: %s [-u|--urgency <arg>] <heading> [<body>]\n' "$0"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-u|--urgency)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_urgency="$2"
				shift
				;;
			--urgency=*)
				_arg_urgency="${_key##--urgency=}"
				;;
			-u*)
				_arg_urgency="${_key##-u}"
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'heading'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require between 1 and 2 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 2 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect between 1 and 2 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_heading _arg_body "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

sudo -u ripytide DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
	notify-send "$1" "$2" -u "$_arg_urgency"
#
# ] <-- needed because of Argbash
