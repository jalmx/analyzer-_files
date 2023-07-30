# Analyzer files

Busca todos los archivos, obtiene su hash, lo almacena y compara todos los archivos para ver si existe repetidos
en caso que existan repetidos, lo indica en un archivo, con su nombre y ruta, los que son iguales en su hash

## How to use


```bash
# It will search inside the path and exclude all files .gitignore and archivo.txt
analyzer  <path> -x ".gitignore,archivo.txt" -r
```

```bash
# It will search inside the path and exclude all files .gitignore and folder node_modules
analyzer <path> -x ".gitignore,node_modules" -r
```


## Help

```bash
    --help                                Provide help
-p, --path=</home/>                       path to search
                                          (defaults to ".")
-r, --recursive                           Search into directory
-h, --hash                                
          [all]                           Apply all hashes
          [md5]                           Hash MD5
          [sha256] (default)              Hash SHA256

-x, --exclude=<node_module,.gitignore>    List of folders or files to exclude in search
                                          Example
                                           -x "node_module,.gitignore,*.txt"
-o, --output=<csv>                        Type of file to save the information

          [csv]                           Save file csv
          [json]                          Save file array json
          [sqlite]                        Save in db SQLite
          [stdout] (default)              Throw to terminal
```

## Install in Linux

Install to `$USER/.local/bin`

```bash
wget https://raw.githubusercontent.com/jalmx/analyzer_files/master/release/analyzer_lastest -O $HOME/.local/bin/analyzer
```

Make executable

```bash
sudo chmod +x /$HOME/.local/bin/analyzer
```


## Create a release

### Step 1

Download repository with git

```bash
git clone 
```