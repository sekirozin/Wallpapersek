# Wallpappersek

Wallpaper animado leve para Linux com Wayland.

O projeto usa a pasta de videos do sistema como padrao inicial, por exemplo `~/Vídeos` em sistemas em portugues ou `~/Videos` em sistemas em ingles. O arquivo escolhido roda como wallpaper animado via `mpvpaper`. A configuracao do player foi pensada para gastar pouco recurso: sem audio, loop infinito, decodificacao por hardware quando disponivel e filtros de escala leves.

## Compatibilidade

O Wallpappersek nao funciona em qualquer Linux no sentido amplo. Ele precisa de:

- Linux com Bash
- sessao Wayland
- `mpvpaper` para usar `play`/`change`
- `mpv`
- `ffmpeg` para `optimize` e `smooth-loop`

Ambientes X11 puros nao sao suportados pelo backend atual. Em desktops Wayland como COSMIC, Hyprland, Sway e outros compositors compativeis com `mpvpaper`, a chance de funcionar e boa desde que as dependencias estejam instaladas.

Verifique o sistema atual:

```bash
./scripts/wallpappersek doctor
```

## Dependencias

No CachyOS/Arch:

```bash
yay -S --needed mpv mpvpaper ffmpeg
```

No Fedora:

```bash
sudo dnf install mpv ffmpeg
```

No Debian/Ubuntu:

```bash
sudo apt install mpv ffmpeg
```

No Fedora, Debian e Ubuntu, o `mpvpaper` pode exigir COPR, pacote de terceiros ou build manual, dependendo da distro e versao.

Veja as recomendacoes pelo proprio projeto:

```bash
./scripts/wallpappersek deps
```

## Estrutura

```text
.
├── README.md
├── install.sh
└── scripts/
    └── wallpappersek
```

## Uso

Definir uma nova pasta padrao de wallpapers:

```bash
wallpappersek set "$HOME/Vídeos/Wallpapers"
```

Importar um video para a pasta padrao:

```bash
./scripts/wallpappersek import ~/Videos/wallpaper.mp4
```

Criar uma versao mais leve do video:

```bash
./scripts/wallpappersek optimize wallpaper.mp4
```

Criar uma versao com loop mais suave:

```bash
./scripts/wallpappersek smooth-loop "Gon 4k.webm"
```

Listar videos salvos:

```bash
./scripts/wallpappersek list
```

Rodar um video como wallpaper animado:

```bash
./scripts/wallpappersek play wallpaper.mp4
```

Depois de instalar, tambem da para trocar usando o comando global:

```bash
Wallpappersek change "/caminho/do/video.mp4"
```

Parar:

```bash
./scripts/wallpappersek stop
```

Ver status:

```bash
./scripts/wallpappersek status
```

Verificar compatibilidade do sistema:

```bash
./scripts/wallpappersek doctor
```

Iniciar automaticamente quando entrar no COSMIC:

```bash
./scripts/wallpappersek autostart "Samurai 4k.webm"
```

Remover a inicializacao automatica:

```bash
./scripts/wallpappersek autostart-disable
```

## Instalar como comando

```bash
./install.sh
```

Depois:

```bash
wallpappersek play wallpaper.mp4
Wallpappersek change "Gon 4k.webm"
```

## Pasta padrao

Por padrao, os videos ficam em:

```text
pasta de videos do sistema
```

Em sistemas em portugues, normalmente isso sera `~/Vídeos`. Em sistemas em ingles, normalmente sera `~/Videos`.

Voce pode trocar a pasta de forma persistente usando:

```bash
wallpappersek set "$HOME/Vídeos/Wallpapers"
```

A configuracao fica salva em:

```text
~/.config/wallpappersek/video-dir
```

Tambem da para trocar temporariamente so para um comando usando:

```bash
WALLPAPPERSEK_VIDEO_DIR="$HOME/Videos/Wallpapers" wallpappersek list
```

## Dicas para ficar leve

Use videos:

- MP4 com H.264
- 1080p ou menor
- 24 ou 30 FPS
- sem audio
- com loop curto e bem comprimido

Evite 4K, 60 FPS, bitrate muito alto e arquivos com audio. Eles funcionam, mas gastam mais CPU/GPU e bateria.

Se o video original for pesado, rode `optimize` e use o arquivo terminado em `-leve.mp4`.

Se o video piscar no fim do loop, rode `smooth-loop` e use o arquivo terminado em `-loop-suave.mp4`. Esse modo toca o video para frente e depois reverso, evitando o corte seco entre o ultimo e o primeiro frame.
