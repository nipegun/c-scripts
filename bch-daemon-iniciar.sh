#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

# ----------
# Script de NiPeGun para iniciar el daemon de bitcoin cash
# ----------

# Ver si la variable de entorno HOME termina con una /
  CarpetaHome="$HOME"
  if [[ "$CarpetaHome" == */ ]]; then
    # Quitarle la /
    CarpetaHome=${CarpetaHome%?}
  fi

# Iniciar el daemon
  echo ""
  echo "  Iniciando el daemon bitcoind..."
  echo ""
  chmod +x $CarpetaHome/Cryptos/BCH/bin/bitcoind 2> /dev/null
           $CarpetaHome/Cryptos/BCH/bin/bitcoind
