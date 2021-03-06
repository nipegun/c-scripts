#!/bin/bash

# Pongo a disposición pública este script bajo el término de "software de dominio público".
# Puedes hacer lo que quieras con él porque es libre de verdad; no libre con condiciones como las licencias GNU y otras patrañas similares.
# Si se te llena la boca hablando de libertad entonces hazlo realmente libre.
# No tienes que aceptar ningún tipo de términos de uso o licencia para utilizarlo o modificarlo porque va sin CopyLeft.

#-----------------------------------------------------------------------
#  Script de NiPeGun para instalar y configurar Swar-Chia-Plot-Manager
#-----------------------------------------------------------------------

## Ver si la variable de entorno HOME termina con una /
   CarpetaHome="$HOME"
   if [[ "$CarpetaHome" == */ ]]; then
     # Quitarle la /
     CarpetaHome=${CarpetaHome%?}
   fi

## Borrar datos de instalaciones anteriores
   rm -rf $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager
   rm -rf $CarpetaHome/Swar-Chia-Plot-Manager
   rm -rf $CarpetaHome/PythonVE-SCPM/

mkdir $CarpetaHome/SoftInst/
cd $CarpetaHome/SoftInst/

## Clonar el repositorio
   echo ""
   echo "  Clonando el repositorio..."
   echo ""
   # Comprobar si el paquete git está instalado. Si no lo está, instalarlo.
      if [[ $(dpkg-query -s git 2>/dev/null | grep installed) == "" ]]; then
        echo ""
        echo "git no está instalado. Iniciando su instalación..."
        echo ""
        su root -c "apt-get -y update"
        su root -c "apt-get -y install git"
      fi
   git clone https://github.com/swar/Swar-Chia-Plot-Manager

## Crear el archivo de configuración
   cp $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml.default $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|chia_location:|chia_location:'$CarpetaHome'/CoresCripto/XCH/bin/resources/app.asar.unpacked/daemon/chia|g' $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|folder_path: S:\\Chia\\Logs\\Plotter|folder_path: '$CarpetaHome'/Chia/Logs/|g'                             $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|max_concurrent: 10|max_concurrent: 6|g'                                                                    $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|max_for_phase_1: 3|max_for_phase_1: 5|g'                                                                   $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e '/- name: micron/,$d'                                                                                         $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo ""                                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "-name: default-home"                                                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_plots: 100"                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  temporary_directory: "$CarpetaHome"/Chia/Siembras"                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  destination_directory: "$CarpetaHome"/Chia/Parcelas"                                                         >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  size: 32"                                                                                                    >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  bitfield: true"                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  threads: 3"                                                                                                  >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  buckets: 128"                                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  memory_buffer: 4192"                                                                                         >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_concurrent: 5"                                                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_concurrent_with_start_early: 5"                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  initial_delay_minutes: 0"                                                                                    >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  stagger_minutes: 5"                                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_for_phase_1: 5"                                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  concurrency_start_early_phase: 4"                                                                            >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  concurrency_start_early_phase_delay: 5"                                                                      >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  temporary2_destination_sync: false"                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  exclude_final_directory: false"                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  skip_full_destinations: true"                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  unix_process_priority: 10"                                                                                   >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  windows_process_priority: 32"                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  enable_cpu_affinity: false"                                                                                  >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  cpu_affinity: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]"                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml

   mkdir -p $CarpetaHome/Chia/Siembras 2> /dev/null
   mkdir -p $CarpetaHome/Chia/Parcelas 2> /dev/null

## Mover el software a la carpeta home del usuario
   mv $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/ $CarpetaHome/Swar-Chia-Plot-Manager/

## Preparar el ambiente virtual
   echo ""
   echo "  Creando el ambiente virtual para Python..."
   echo ""
   cd $CarpetaHome/Swar-Chia-Plot-Manager/
   ## Comprobar si el paquete python3-venv está instalado. Si no lo está, instalarlo.
   if [[ $(dpkg-query -s python3-venv 2>/dev/null | grep installed) == "" ]]; then
       echo ""
       echo "python3-venv no está instalado. Iniciando su instalación..."
       echo ""
       su root -c "apt-get -y update"
       su root -c "apt-get -y install python3-venv"
   fi
   python3 -m venv PythonVE-SCPM
   echo ""
   echo "  Activando el ambiente virtual..."
   echo ""
   #. $CarpetaHome/PythonVE-SCPM/bin/activate
   source $CarpetaHome/PythonVE-SCPM/bin/activate

## Instalar los requisitos en el ambiente virtual
   echo ""
   echo "  Instalando los requisitos dentro del ambiente virtual..."
   echo ""
   ## Comprobar si el paquete python3-pip está instalado. Si no lo está, instalarlo.
      if [[ $(dpkg-query -s python3-pip 2>/dev/null | grep installed) == "" ]]; then
          echo ""
          echo "python3-pip no está instalado. Iniciando su instalación..."
          echo ""
          su root -c "apt-get -y update"
          su root -c "apt-get -y install python3-pip"
      fi
      which pip
      pip3 install wheel
      pip3 install -r $CarpetaHome/Swar-Chia-Plot-Manager/requirements.txt

## Correr el programa
    python3 $CarpetaHome/Swar-Chia-Plot-Manager/manager.py start
    python3 $CarpetaHome/Chia-Swar-Plot-Manager/manager.py view

#########################
apt-get -y install python3-dev python3-pip python3-venv python3-wheel

cd /root
git clone https://github.com/swar/Swar-Chia-Plot-Manager
pip3 install virtualenv
python3 -m venv swar
source /root/swar/bin/activate

# Inside virtual environment
pip3 install wheel
pip3 install -r /root/Swar-Chia-Plot-Manager/requirements.txt

# Conf
cd /root/Swar-Chia-Plot-Manager/
cp /root/Swar-Chia-Plot-Manager/config.yaml.default /root/Swar-Chia-Plot-Manager/config.yaml
sed -i -e 's|chia_location:|chia_location:/root/CoresCripto/XCH/bin/resources/app.asar.unpacked/daemon/chia|g' /root/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|folder_path: S:\\Chia\\Logs\\Plotter|folder_path: /root/Chia/Logs/|g'                          /root/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|max_concurrent: 10|max_concurrent: 6|g'                                                        /root/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e 's|max_for_phase_1: 3|max_for_phase_1: 5|g'                                                       /root/Swar-Chia-Plot-Manager/config.yaml
   sed -i -e '/- name: micron/,$d'                                                                             /root/Swar-Chia-Plot-Manager/config.yaml
   echo ""                                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "-name: default-home"                                                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_plots: 100"                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  temporary_directory: "$CarpetaHome"/Chia/Siembras"                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  destination_directory: "$CarpetaHome"/Chia/Parcelas"                                                         >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  size: 32"                                                                                                    >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  bitfield: true"                                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  threads: 3"                                                                                                  >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  buckets: 128"                                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  memory_buffer: 4192"                                                                                         >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_concurrent: 5"                                                                                           >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_concurrent_with_start_early: 5"                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  initial_delay_minutes: 0"                                                                                    >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  stagger_minutes: 5"                                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  max_for_phase_1: 5"                                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  concurrency_start_early_phase: 4"                                                                            >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  concurrency_start_early_phase_delay: 5"                                                                      >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  temporary2_destination_sync: false"                                                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  exclude_final_directory: false"                                                                              >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  skip_full_destinations: true"                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  unix_process_priority: 10"                                                                                   >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  windows_process_priority: 32"                                                                                >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  enable_cpu_affinity: false"                                                                                  >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml
   echo "  cpu_affinity: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]"                                          >> $CarpetaHome/SoftInst/Swar-Chia-Plot-Manager/config.yaml

# Ejecutar
python3 manager.py start


