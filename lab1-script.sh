#!/bin/sh

echo "Numero de IP"

ip a

echo "------"

echo "Resultado de system"
snmpwalk -v 1 -c public localhost system

echo "Resultado de interfaces"
snmpwalk -v 1 -c public localhost interfaces

echo "Resultado completo"

snmpwalk -v 1 -c public localhost

echo "Resultado de disco"
snmpwalk -v 1 -c public $IP dskPercent.1