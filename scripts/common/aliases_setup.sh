ALIAS_FILE=~/.bash_it/aliases/enabled/general.aliases.bash
if ! grep -Fxq "#Workstation_alias" ${ALIAS_FILE}; then
  printf "%s\\n" "#Workstation_alias" >> ${ALIAS_FILE}
  printf "%s\\n" "source ${WORKSTATION_SETUP_HOME}/files/aliases.sh" >> ${ALIAS_FILE}
fi