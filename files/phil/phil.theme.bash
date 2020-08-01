#!/usr/bin/env bash

#colors: black, red, green, brown, blue, purple, cyan, white
#can be prefixed with "bold" and "underline"
italic_black="\e[3;30m"
italic_red="\e[3;31m"
italic_green="\e[3;32m"
italic_brown="\e[3;33m"
italic_blue="\e[3;34m"
italic_purple="\e[3;35m"
italic_cyan="\e[3;36m"
italic_white="\e[3;37m"
# 9 is crossthrough
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX="${green}"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

GIT_SHA_PREFIX=" ${green}|"
GIT_SHA_SUFFIX=""

BATTERY_PREFIX=" ${bold_red}"
BATTERY_SUFFIX="%"

THEME_CLOCK_COLOR="${cyan}"


# This Phil's customization of Pivotal's customization of the bobby theme, plus stuff from luan et. al.

function git_short_sha() {
	scm
 	if [[ $SCM == $SCM_GIT ]]; then
    	local git_sha=$(git rev-parse --short HEAD 2> /dev/null) && echo -e "$GIT_SHA_PREFIX${git_sha}$GIT_SHA_SUFFIX"
  	fi
}

function conditional_battery_char() {
	if [[ ! "$(battery_percentage)" == "100" ]]; then
    	echo -e "$BATTERY_PREFIX$(battery_percentage)$BATTERY_SUFFIX"
	fi
}
if ! _command_exists battery_percentage ; then
    function conditional_battery_char() {
		# no op
		echo -n
    }
fi

funky="\e[3;36m\]"

function prompt_command() {
	local batt="$(conditional_battery_char)"
    local dtime="$(clock_prompt)"
    local rvm_ruby="${yellow}$(ruby_version_prompt)${normal}"
    local user="${purple}\u"
    local at="${purple}@"
    local host="${purple}\h"
    local in="${normal}in"
    local pwd="${bold_blue}\w"
    local scm="${bold_cyan}$(scm_char)"
    local sha="$(git_short_sha)"
    local git_branch="$(scm_prompt_info)"
    local prompt="${bold_white}→${normal}"

    # PS1="${dtime}${user}${at}${host}:${current_dir} ${rvm_ruby} ${git_branch}
    #   $prompt"
    # PS1="\n${dtime}${batt} ${user}${at}${host} ${in} ${pwd}\n${scm}${sha}${git_branch} ${prompt} "
    PS1="\n${dtime}${batt} ${pwd}\n${scm}${sha}${git_branch} ${prompt} "
}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$yellow"}
THEME_CLOCK_FORMAT=${THEME_TIME_FORMAT:-"%I:%M:%S"}
# THEME_CLOCK_FORMAT=${THEME_TIME_FORMAT:-"%I:%M"}

safe_append_prompt_command prompt_command;
