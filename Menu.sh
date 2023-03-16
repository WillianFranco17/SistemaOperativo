function main(){
while :
do
	clear
	unset opcion
	echo "---------------------------------"
	echo "Menu:"
	echo ""
	echo "1.Cambiar nombre de servidor"
	echo "2.Cambiar particion discos"
	echo "3.Cambiar IP servidor"
	echo "4.Cambiar tabla de host"
	echo "5.Agregar permisos de firewall"
	echo "6.Editar DNS Server"
	echo "7.Configurar Proxy"
	echo "8.Instalar Docker"
	echo "9.Salir de este menu"
	echo "---------------------------------"
	read -p "Digite la opcion deseada: " opcion
	echo "---------------------------------"
	case "$opcion" in
		"1")
			echo "Informacion del servidor:"
			echo ""
			hostnamectl
			echo ""
			read -p "Desea cambiar el nombre del servidor(Y/N)?: " op1
			if [[ $op1 =~ ^[Yy]$ ]]
				then
					echo ""
					read -p "Digite el nuevo nombre del servidor: " nombre
					echo ""
					sudo hostnamectl set-hostname "$nombre"
					echo ""
					echo "El cambio de nombre se ha realizado de manera satisfactoria"
					echo ""
					hostnamectl
			elif [[ $op1 =~ ^[Nn]$ ]]
				then
					main
			else
				echo "Opcion Invalida"
				read -p "Presiones [Enter] para continuar"
				readEnterKey
			fi
			;;
		"2")
			echo "Estos son los discos de su maquina"
			sudo fdisk -l
			echo ""
			read -p "Ingrese el disco sobre el cual desea trabajar: " disco
			echo ""
			sudo fdisk /dev/$disco
			;;
		"3")
			echo "Esta es la opcion para cambiar IP servidor"
			echo ""
			read -p "Desea instalar net-tools(Y/N)?: " op3 
			if [[ $op3 =~ ^[Yy]$ ]]
				then
					sudo apt install net-tools
					echo ""
					echo "net-tools ha sido instalado"
			fi		
			echo ""
			ip addr show
			echo ""
			read -p "Digite la interfaz de la red la cual desea modificar: " red
			echo ""
			read -p "Digite la nueva IP: " IPn
			echo ""
			read -p "Digite la mascara de red: " mask
			echo ""
			sudo ifconfig $red $IPn netmask $mask
			echo ""
			echo "El cambio se a hecho satisfactoriamente"
			echo ""
			ip addr show
			;;
		"4")
			echo "Cambiar tabla de host"
			sudo nano /etc/hosts
			echo ""
			echo "La tabla de hosts ha sido modificada"
			echo ""
			cd
			cd /etc 
			cat hosts
			;;
		"5")
			echo "Esta es la opcion para agregar permisos de firewall"
			while :
			do
				echo "----------------------------------"
				echo "Opciones de permisos de firewall"
				echo "1.Habilitar servicio"
				echo "2.Conocer el estado del firewall"
				echo "3.Habilitar puerto TCP"
				echo "4.Habilitar puerto UDP"
				echo "5.Habilitar rango puerto TCP"
				echo "6.Habilitar rango puerto UDP"
				echo "7.Probar con curl"
				echo "8.Salir al menu principal"
				echo "----------------------------------"
				read -p "Digite la opcion deseada: " op5
				echo "----------------------------------"
				case "$op5" in
					"1")
						sudo ufw enable
						echo ""
						;;
					"2")
						sudo ufw status
						echo ""
						;;
					"3")
						read -p "Ingrese el puerto TCP: " TCP
						sudo ufw allow $TCP/tcp
						echo ""
						;;
					"4")
						read -p "Ingrese el puerto UDP: " UDP
						sudo ufw allow $UDP/udp
						echo ""
						;;
					"5")
						sudo ufw allow 30000:32767/tcp
						echo ""
						;;
					"6")
						sudo ufw allow 30000:32767/udp
						echo ""
						;;
					"7")
						read -p "Ingrese la IP: " IPp
						echo ""
						read -p "Ingrese el puerto: " puertop
						echo ""
						curl -v telnet://$IPp:$puertop
						echo ""
						;;
					"8")
						main
						;;
					*)
						echo "Opcion Invalida"
						read -p "Presione [Enter] para continuar" readEnterKey
						;;
				esac
			done 
			;;
		"6")
			echo "Esta es la opcion para agregar editar DNS Serve"
			while :
			do
				echo "----------------------------------"
				echo "Opciones de configuracion DNS"
				echo "1.Instalar resolvconf"
				echo "2.Habilitar servicio DNS"
				echo "3.Detener servico DNS"
				echo "4.Estado del servicio DNS"
				echo "5.Reiniciar servico DNS"
				echo "6.Editar DNS"
				echo "7.Salir al menu principal"
				echo "----------------------------------"
				read -p "Digite la opcion deseada: " op6
				echo "----------------------------------"
				case "$op6" in
					"1")
						sudo apt install resolvconf
						echo ""
						;;
					"2")
						sudo service resolvconf start
						echo ""
						;;
					"3")
						sudo service resolvconf stop
						echo ""
						;;
					"4")
						sudo service resolvconf status
						echo ""
						;;
					"5")
						sudo service resolvconf restart
						echo ""
						;;
					"6")
						sudo nano /etc/resolv.conf 
						echo ""
						cat /etc/resolv.conf
						echo ""
						;;
					"7")
						main
						;;
				esac
			done
			;;
		"7")
			echo "Configuracion del PROXY"
			echo "---------------------------------------"
			echo "Configuracion estandar del archivo Proxy"
			echo ""
			echo 'PROXY_ENABLED="yes"'
			echo 'HTTP_PROXY="ip:puerto"'
			echo 'HTTPS_PROXY="ip:puerto"'
			echo 'FTP_PROXY="ip:puerto"'
			echo 'NO_PROXY="localhost,127.0.01,"'
			echo ""
			echo "IMPORTANTE: RECUERDE COPIAR LA CONFIGURACION PROXY AL FINAL DEL DOCUMENTO SIN MODIFICAR OTRA PARTE DEL ARCHIVO"
			if [[ $op7 =~ ^[Yy]$ ]]
				then
					cd
					sudo nano .bashrc
					echo "El proxy ha sido modificado"
					echo ""
					echo "El proxy quedo de la siguiente manera: "
					cat .bashrc
			elif [[$op7 =~ ^[Nn]$ ]]
				then
					main
			else
				echo "Opcion Invalida"		
			fi
			echo ""
			;;
		"8")
			# Ejecucion
            echo "-----------------------------------------------------------------------------"
            echo "Inicia instalacion docker CE                                                 "
            echo "-----------------------------------------------------------------------------"
            read -p ">> Paso 1: Desea Instalar Docker (y/n)? " answer

            if [[ $answer =~ ^[Yy]$ ]]
                then
                    cd ~/

                    echo "-----------------------------------------------------------------------------"
                    echo "Instalación Prerequisitios"
                    echo "-----------------------------------------------------------------------------"
                    sudo apt-get update -y
                    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
                    sudo apt update -y
                    apt-cache policy docker-ce 
                    sudo apt install docker-ce -y

                    echo "-----------------------------------------------------------------------------"
                    echo "Verificar Version"
                    echo "-----------------------------------------------------------------------------"
                    docker --version

                    echo "-----------------------------------------------------------------------------"
                    echo "Iniciar docker con el sistema"
                    echo "-----------------------------------------------------------------------------"
                    sudo systemctl enable docker
                    sudo systemctl start docker
                    
                    echo "-----------------------------------------------------------------------------"
                    echo "Crear usuario de Docker"
                    echo "-----------------------------------------------------------------------------"
                    sudo adduser docker

                    
                    echo "-----------------------------------------------------------------------------"
                    echo "Agregar permisos usuario ubunutu al grupo Docker"
                    echo "-----------------------------------------------------------------------------"
                    user=$(whoami)
                    sudo usermod -G docker $user
                    grep $user /etc/group

                    echo "-----------------------------------------------------------------------------"
                    echo "folder docker"
                    echo "-----------------------------------------------------------------------------"
                    folder=/Images
                    sudo mkdir -p $folder/$user
                    sudo mkdir -p $folder/$user/Data
                    sudo chown -R $user:$user $folder/$user
                    sudo chown -R $user:$user $folder/$user/Data
                    ls -ltr $folder/

                    read -p "Press [Enter] key to continue..." readEnterKey

                    echo "-----------------------------------------------------------------------------"
                    echo "Inicia instalacion Docker Compose                                            "
                    echo "-----------------------------------------------------------------------------"

                    sudo mkdir -p /usr/local/bin
                    sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

                    sudo chmod +x /usr/local/bin/docker-compose

                    echo "-----------------------------------------------------------------------------"
                    echo "Verificar docker-compose"
                    echo "-----------------------------------------------------------------------------"
                    sudo docker-compose --version

                    read -p "Press [Enter] key to continue..." readEnterKey


                    echo "-----------------------------------------------------------------------------"
                    echo "Fin instalacion Docker                                                       "
                    echo "-----------------------------------------------------------------------------"

                    read -p "Press [Enter] key to continue..." readEnterKey
            fi
            echo "-----------------------------------------------------------------------------"
            echo "Sin Ajustes!!"
            echo "-----------------------------------------------------------------------------"
                
            echo ---------- Fin del Script ----------------------------
            read -p "Press [Enter] key to continue..." readEnterKey
			;;
		"9")
			exit
			;;
		*)
			echo "Opcion Invalida"
			read -p "Presione [Enter] para continuar" readEnterKey
			;;
	esac
done
}
main