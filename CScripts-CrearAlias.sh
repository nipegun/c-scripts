#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------------------
#  Script de NiPeGun para crear los alias de los c-scripts 
#-----------------------------------------------------------

ColorVerde="\033[1;32m"
FinColor="\033[0m"

echo ""
echo -e "${ColorVerde}Creando alias para los c-scripts...${FinColor}"
echo ""

## Ver si la variable de entorno HOME termina con una /
   CarpetaInst="$HOME"
   if [[ "$CarpetaInst" == */ ]]; then
     # Quitarle la /
     CarpetaInst=${CarpetaInst%?}
   fi

ln -s $CarpetaInst/scripts/c-scripts/Discos-NVMe-Salud.sh              $CarpetaInst/scripts/c-scripts/Alias/dnvmes

echo ""
echo -e "${ColorVerde}Alias creados. Deberías poder ejecutar los c-scripts escribiendo el nombre de su alias.${FinColor}"
echo ""

