#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#------------------------------------------------------
#  Script de NiPeGun para parar el daemon de digibyte
#------------------------------------------------------

## Ver si la variable de entorno HOME termina con una /
   CarpetaHome="$HOME"
   if [[ "$CarpetaHome" == */ ]]; then
     # Quitarle la /
     CarpetaHome=${CarpetaHome%?}
   fi

echo ""
echo "  Parando el daemon digibyted..."
echo ""
chmod +x $CarpetaHome/Cryptos/DGB/bin/digibyte-cli 2> /dev/null
$CarpetaHome/Cryptos/DGB/bin/digibyte-cli stop

