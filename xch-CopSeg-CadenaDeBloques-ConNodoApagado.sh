#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
#  Script de NiPeGun para hacer copia de seguridad de la cadena de bloques de chia con el nodo apagado
#
#  Ejecución remota:
#  curl -s https://raw.githubusercontent.com/nipegun/ecoin-scripts/main/xch-CopSeg-CadenaDeBloques-ConNodoApagado.sh | bash
#  curl -s https://raw.githubusercontent.com/nipegun/ecoin-scripts/main/xch-CopSeg-CadenaDeBloques-ConNodoApagado.sh | sed 's-vCarpetaCopSeg="/CopSegInt"-vCarpetaCopSeg="/Copia"-g' | bash
# ----------

ColorRojo='\033[1;31m'
ColorVerde='\033[1;32m'
FinColor='\033[0m'

vFechaDeEjecCopSeg=$(date +A%Y-M%m-D%d@%T)
vCarpetaCopSeg="/CopSegInt"

# Definir la carpeta de usuario
  # Ver si la variable de entorno HOME termina con una /
     vCarpetaUsuario="$HOME"
     if [[ "$vCarpetaUsuario" == */ ]]; then
       # Quitarle la /
       vCarpetaUsuario="${vCarpetaUsuario%?}"
     fi

vCarpetaBD="$vCarpetaUsuario/.chia/mainnet/db/"

echo ""
echo -e "${ColorVerde}  Iniciando la copia de seguridad de la base de datos del nodo Chia...${FinColor}"
echo ""

mkdir -p "$vCarpetaCopSeg"/XCH/CopSegBD/$vFechaDeEjecCopSeg 2> /dev/null

# Comprobar si el paquete rsync está instalado. Si no lo está, instalarlo.
  if [[ $(dpkg-query -s rsync 2>/dev/null | grep installed) == "" ]]; then
    echo ""
    echo "  rsync no está instalado. Iniciando su instalación..."
    echo ""
    apt-get -y update
    apt-get -y install rsync
    echo ""
  fi
#rsync -a --delete /Discos/HDD-CopSeg/ /Discos/HDD-CopSegExt

rsync -av "$vCarpetaBD" "$vCarpetaCopSeg"/XCH/CopSegBD/$vFechaDeEjecCopSeg

