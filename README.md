# Ricty Generator

プログラミング用フォント [Ricty](https://rictyfonts.github.io/) を生成します。

## 使用方法

```
docker run [--rm] ghcr.io/sublintimate/ricty-generator [options] auto > ricty.zip
```

生成されたフォントはZIPアーカイブとして標準出力されます。
カレントディレクトリーなどにリダイレクトしてファイルを受け取ってください。

オプションは公式の生成スクリプトと同様に利用できます。

<details><summary>使用例</summary>

- Linux
  - Bash
    ```
    docker run --rm ghcr.io/sublintimate/ricty-generator -z -d \''"*+,.-=0:;<^`r~' auto > ricty.zip
    ```

- Windows
  - コマンドプロンプト
    ```
    docker run --rm ghcr.io/sublintimate/ricty-generator -z -d "'""*+,.-=0:;<^`r~" auto > ricty.zip
    ```

  - PowerShell
    ```
    cmd /C 'docker run --rm ghcr.io/sublintimate/ricty-generator -z -d "''""*+,.-=0:;<^`r~" auto > ricty.zip'
    ```

  - PowerShell (Alternative)
    ```
    Start-Process -NoNewWindow -Wait -FilePath docker -ArgumentList 'run --rm ghcr.io/sublintimate/ricty-generator -z -d ''\"*+,.-=0:;<^`r~ auto' -RedirectStandardOutput ricty.zip
    ```
</details>

## ライセンス

生成されたフォントのライセンスについては[公式サイト](https://rictyfonts.github.io/)をご確認ください。

## Ricty 公式サイト

https://rictyfonts.github.io/
