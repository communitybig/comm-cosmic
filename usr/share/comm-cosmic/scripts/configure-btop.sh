#!/usr/bin/env bash

# Função para configurar o btop
configure_btop() {
    echo "Configurando terminal para btop..."
    
    # Verificar se o arquivo btop.desktop existe
    if [ -f /usr/share/applications/btop.desktop ]; then
        # Backup do arquivo original (opcional)
        cp -f /usr/share/applications/btop.desktop /usr/share/applications/btop.desktop.bak
        
        # Substituir conteúdo
        cat > /usr/share/applications/btop.desktop << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=btop++
GenericName=System Monitor
GenericName[it]=Monitor di sistema
Comment=Resource monitor that shows usage and stats for processor, memory, disks, network and processes
Comment[it]=Monitoraggio delle risorse: mostra utilizzo e statistiche per CPU, dischi, rete e processi
Icon=btop
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- btop; elif command -v kitty >/dev/null; then kitty btop; elif command -v konsole >/dev/null; then konsole -e btop; else x-terminal-emulator -e btop; fi"
Terminal=false
Categories=System;Monitor;ConsoleOnly;
Keywords=system;process;task

Actions=SoftwareRender;

[Desktop Action SoftwareRender]
Name=Software Render
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- env SoftwareRender=1 btop; elif command -v kitty >/dev/null; then kitty env SoftwareRender=1 btop; elif command -v konsole >/dev/null; then konsole -e env SoftwareRender=1 btop; else x-terminal-emulator -e env SoftwareRender=1 btop; fi"
EOF
        echo "Configuração do btop concluída."
    else
        echo "Arquivo btop.desktop não encontrado. Instalando versão personalizada..."
        # Criar o arquivo mesmo se não existir
        cat > /usr/share/applications/btop.desktop << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=btop++
GenericName=System Monitor
GenericName[it]=Monitor di sistema
Comment=Resource monitor that shows usage and stats for processor, memory, disks, network and processes
Comment[it]=Monitoraggio delle risorse: mostra utilizzo e statistiche per CPU, dischi, rete e processi
Icon=btop
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- btop; elif command -v kitty >/dev/null; then kitty btop; elif command -v konsole >/dev/null; then konsole -e btop; else x-terminal-emulator -e btop; fi"
Terminal=false
Categories=System;Monitor;ConsoleOnly;
Keywords=system;process;task

Actions=SoftwareRender;

[Desktop Action SoftwareRender]
Name=Software Render
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- env SoftwareRender=1 btop; elif command -v kitty >/dev/null; then kitty env SoftwareRender=1 btop; elif command -v konsole >/dev/null; then konsole -e env SoftwareRender=1 btop; else x-terminal-emulator -e env SoftwareRender=1 btop; fi"
EOF
        echo "Versão personalizada do btop.desktop instalada."
    fi
}

# Executar a função
configure_btop
