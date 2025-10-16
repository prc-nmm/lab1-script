#!/bin/bash

# Comprueba si se proporcionaron los argumentos necesarios (IP y Comunidad)
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Uso: $0 <IP_del_dispositivo> <Comunidad_SNMP>"
    echo "Ejemplo: $0 192.168.1.10 public"
    exit 1
fi

# Asignar los argumentos a variables con nombres descriptivos
IP_DISPOSITIVO="$1"
COMUNIDAD_SNMP="$2"

echo "====================================="
echo "  SNMPWALK para IP: $IP_DISPOSITIVO"
echo "  Comunidad: $COMUNIDAD_SNMP"
echo "====================================="
echo ""

# Mostrar la IP de la máquina donde se ejecuta el script (solo informativo)
echo "Numero de IP (Local)"
ip a
echo "-------------------------------------"

# =========================================================================
# Ejecución de SNMPWALK con las variables
# =========================================================================

echo "Resultado de system"
snmpwalk -v 1 -c "$COMUNIDAD_SNMP" "$IP_DISPOSITIVO" system
echo ""

echo "Resultado de interfaces"
snmpwalk -v 1 -c "$COMUNIDAD_SNMP" "$IP_DISPOSITIVO" interfaces
echo ""

#echo "Resultado completo (Descomentar para ver todos los MIBs)"
#snmpwalk -v 1 -c "$COMUNIDAD_SNMP" "$IP_DISPOSITIVO"

echo "Resultado de disco (Uso del primer disco)"
snmpwalk -v 1 -c "$COMUNIDAD_SNMP" "$IP_DISPOSITIVO" dskPercent.1
echo "-------------------------------------"
echo "Finalizado."
