# Wallpappersek

Wallpaper animado leve para CachyOS com COSMIC.

O projeto usa `~/Downloads/Youtube` como pasta padrao de videos e roda o arquivo escolhido como wallpaper animado via `mpvpaper`, que e uma solucao simples para desktops Wayland. A configuracao do player foi pensada para gastar pouco recurso: sem audio, loop infinito, decodificacao por hardware quando disponivel e filtros de escala leves.

## Dependencias

No CachyOS/Arch:

```bash
yay -S --needed mpv mpvpaper
```

Verifique pelo proprio projeto:

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

Importar um video para a pasta padrao `~/Downloads/Youtube`:

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
~/Downloads/Youtube
```

Voce pode trocar a pasta usando:

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
