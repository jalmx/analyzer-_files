# Analyzer files

Busca todos los archivos, obtiene su hash, lo almacena y compara todos los archivos para ver si existe repetidos
en caso que existan repetidos, lo indica en un archivo, con su nombre y ruta, los que son iguales en su hash

Parámetros

- default(./) <path> file or directory
- recursivo -r --recursive
- archivo de salida (default: stdout) -json -csv -sqlite (future: html, may be)
- hash (default: sha256) -md5, -sha256, -all
- exclude (default: "") *.txt node_module .gitignore
