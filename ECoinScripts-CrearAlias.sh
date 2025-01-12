#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
# Script de NiPeGun para crear los alias de los ecoin-scripts
#
# Ejecución remota para usuario normal con permiso sudo:
#   curl -sL https://raw.githubusercontent.com/nipegun/ecoin-scripts/refs/heads/main/ECoinScripts-CrearAlias.sh | bash
#
# Ejecución remota con el usuario root:
#   curl -sL https://raw.githubusercontent.com/nipegun/ecoin-scripts/refs/heads/main/ECoinScripts-CrearAlias.sh | sed 's-sudo--g'| bash
# ----------

# Definir variables de color
  vColorAzul="\033[0;34m"
  vColorAzulClaro="\033[1;34m"
  vColorVerde='\033[1;32m'
  vColorRojo='\033[1;31m'
  vFinColor='\033[0m'

echo ""
echo -e "${vColorAzulClaro}  Creando alias para los ecoin-scripts...${vFinColor}"
echo ""

# Borrar los alias previamente creados
  rm -rf ~/scripts/ecoin-scripts/Alias/*

# Crear nuevos alias
  ln -s ~/scripts/ecoin-scripts/ECoinScripts-Sincronizar.sh ~/scripts/ecoin-scripts/Alias/sinecs

echo ""
echo -e "${vColorVerde}    Alias creados. Deberías poder ejecutar los ecoin-scripts escribiendo el nombre de su alias.${vFinColor}"
echo ""

