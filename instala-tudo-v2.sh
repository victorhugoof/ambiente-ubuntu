#!/bin/bash
set -e

confirm() {
  while true; do
    read -r -p "${1:-Continue?} [s/N]: " REPLY
    case $REPLY in
    [sS])
      echo "true"
      break
      ;;
    [nN])
      echo "false"
      break
      ;;
    *) printf " \033[31m %s \n\033[0m" "invalid input" ;;
    esac
  done
}

if [ "$EUID" -ne 0 ]; then
  echo "Execute o script com sudo"
  exit
fi

echo "Olá, $SUDO_USER"

INSTALAR_JAVA8=$(confirm "Instalar java 8?")
INSTALAR_JAVA11=$(confirm "Instalar java 11?")
INSTALAR_JAVA14=$(confirm "Instalar java 14?")
INSTALAR_JAVA17=$(confirm "Instalar java 17?")
INSTALAR_MAVEN=$(confirm "Instalar maven?")
INSTALAR_NODE=$(confirm "Instalar node?")
INSTALAR_FIREWALL=$(confirm "Instalar firewall?")
INSTALAR_GIT=$(confirm "Instalar git?")
INSTALAR_DOCKER=$(confirm "Instalar docker?")
INSTALAR_IDEA=$(confirm "Instalar IDEA?")
INSTALAR_DATAGRIP=$(confirm "Instalar DataGrip?")
INSTALAR_WEBSTORM=$(confirm "Instalar WebStorm?")
INSTALAR_VSCODE=$(confirm "Instalar VSCode?")
INSTALAR_SUBLIME=$(confirm "Instalar Sublime?")
INSTALAR_POSTMAN=$(confirm "Instalar Postman?")
INSTALAR_FONTSMS=$(confirm "Instalar Fonts MS?")
INSTALAR_THEME=$(confirm "Instalar Theme?")
INSTALAR_CUSTOM_SHELL=$(confirm "Instalar CustomShell?")

echo ""
echo "Vai instalar:"
$INSTALAR_JAVA8 && echo "Java 8"
$INSTALAR_JAVA11 && echo "Java 11"
$INSTALAR_JAVA14 && echo "Java 14"
$INSTALAR_JAVA17 && echo "Java 17"
$INSTALAR_MAVEN && echo "Maven"
$INSTALAR_NODE && echo "Node"
$INSTALAR_FIREWALL && echo "Firewall"
$INSTALAR_GIT && echo "Git"
$INSTALAR_DOCKER && echo "Docker"
$INSTALAR_IDEA && echo "IDEA"
$INSTALAR_DATAGRIP && echo "DataGrip"
$INSTALAR_WEBSTORM && echo "WebStorm"
$INSTALAR_VSCODE && echo "VSCode"
$INSTALAR_SUBLIME && echo "Sublime"
$INSTALAR_POSTMAN && echo "Postman"
$INSTALAR_FONTSMS && echo "Fonts MS"
$INSTALAR_THEME && echo "Theme"
$INSTALAR_CUSTOM_SHELL && echo "CustomShell"

echo ""
CONTINUAR=$(confirm "Continuar?")
if [ "$CONTINUAR" == "true" ]; then
  echo "continuando.."
else
  echo "Processo cancelado.."
  exit 1
fi
