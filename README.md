XeLaTeX Auto Build
==================

Features
--------
* Generate from LaTeX to PDF (require xelatex command)
* HTTP Server & Livereload

How to Start
------------
1. `npm install`
1. `npm start`
1. save `src/report.tex`
1. open `http://localhost:8000/report.pdf`

日本語でおｋ
----------
XeLaTeX のファイルを `src` ディレクトリ以下に置いて、好きなエディタで編集すると、自動で `xelatex` コマンドを叩いて PDF を生成し HTTP サーバで配信するよ！  
さらに、 `Livereload` に対応しているから、ブラウザで PDF を開いておくと幸せになれるよ。

Directory
---------
* ___dest___ - PDF が出力されるディレクトリ
* ___documents___ - 完成したレポートのソースと PDF 置き場 (参照されない)
* ___src___ - XeLaTeX のソースを置くディレクトリ (拡張子は `.tex` である必要がある)
