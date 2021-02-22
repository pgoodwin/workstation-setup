ALIAS_FILE=~/.bash_it/aliases/available/general.aliases.bash
touch $ALIAS_FILE
if ! grep -Fxq "#Workstation_alias" ${ALIAS_FILE}; then
  printf "%s\\n" "#Workstation_alias" >> ${ALIAS_FILE}
  printf "%s\\n" "source ${WORKSTATION_SETUP_HOME}/files/aliases.sh" >> ${ALIAS_FILE}
fi
