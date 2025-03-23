#!/usr/bin/env bash

# Função para configurar o pacseek
configure_pacseek() {
    echo "Configurando terminal para pacseek..."
    
    # Verificar se o arquivo pacseek.desktop existe
    if [ -f /usr/share/applications/org.moson.pacseek.desktop ]; then
        # Backup do arquivo original (opcional)
        cp -f /usr/share/applications/org.moson.pacseek.desktop /usr/share/applications/org.moson.pacseek.desktop.bak
        
        # Substituir conteúdo
        cat > /usr/share/applications/org.moson.pacseek.desktop << 'EOFINNER'
[Desktop Entry]

Name=pacseek
Comment=A terminal user interface for searching and installing Arch Linux packages

Icon=pacseek
Type=Application
Categories=Utility;
Keywords=terminal;package;

Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
Terminal=false
StartupNotify=false

[Desktop Action SoftwareRender]
Name=Software Render
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
EOFINNER
        echo "Configuração do pacseek concluída."
    else
        echo "Arquivo org.moson.pacseek.desktop não encontrado. Verificando localizações alternativas..."
        
        # Verificar se existe em outra localização
        if [ -f /usr/share/applications/pacseek.desktop ]; then
            cp -f /usr/share/applications/pacseek.desktop /usr/share/applications/pacseek.desktop.bak
            
            cat > /usr/share/applications/pacseek.desktop << 'EOFINNER'
[Desktop Entry]

Name=pacseek
Comment=A terminal user interface for searching and installing Arch Linux packages

Icon=pacseek
Type=Application
Categories=Utility;
Keywords=terminal;package;

Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
Terminal=false
StartupNotify=false

[Desktop Action SoftwareRender]
Name=Software Render
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
EOFINNER
            echo "Configuração do pacseek concluída em localização alternativa."
        else
            echo "Pacseek não parece estar instalado. Criando arquivo de desktop..."
            # Criar o arquivo de desktop para quando pacseek for instalado
            cat > /usr/share/applications/org.moson.pacseek.desktop << 'EOFINNER'
[Desktop Entry]

Name=pacseek
Comment=A terminal user interface for searching and installing Arch Linux packages

Icon=pacseek
Type=Application
Categories=Utility;
Keywords=terminal;package;

Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
Terminal=false
StartupNotify=false

[Desktop Action SoftwareRender]
Name=Software Render
Exec=sh -c "if command -v gnome-terminal >/dev/null; then gnome-terminal -- pacseek; elif command -v kitty >/dev/null; then kitty pacseek; elif command -v konsole >/dev/null; then konsole -e pacseek; else x-terminal-emulator -e pacseek; fi"
EOFINNER
            echo "Arquivo de desktop para pacseek criado."
        fi
    fi
}

# Executar a função
configure_pacseek
