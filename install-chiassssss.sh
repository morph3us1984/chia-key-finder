cd ~
git clone https://github.com/Chia-Network/chia-blockchain -b 1.6.1 chia-blockchain1
for num in {2..32}
do
cp -r chia-blockchain1 chia-blockchain$num
done
for num in {1..9}
do
echo -e "from __future__ import annotations\n" > $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "import os" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "from pathlib import Path\n" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "DEFAULT_ROOT_PATH = Path(os.path.expanduser(os.getenv(\"CHIA_ROOT\", \"~/.chia$num/mainnet\"))).resolve()\n" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "DEFAULT_KEYS_ROOT_PATH = Path(os.path.expanduser(os.getenv(\"CHIA_KEYS_ROOT\", \"~/.chia_keys$num\"))).resolve()" >> $HOME/chia-blockchain$num/chia/util/default_root.py
cd $HOME/chia-blockchain$num/ && sh install.sh && . ./activate && chia init && chia init --fix-ssl-permissions && cd ..
chia configure --testnet true
sed -ri 's/^(\s*)(daemon_port\s*:\s*55400\s*$)/\1daemon_port: '"5540$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
sed -ri 's/^(\s*)(port\s*:\s*8449\s*$)/\1port: '"850$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
sed -ri 's/^(\s*)(rpc_port\s*:\s*9256\s*$)/\1rpc_port: '"930$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
deactivate
done
for num in {10..32}
do
echo -e "from __future__ import annotations\n" > $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "import os" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "from pathlib import Path\n" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "DEFAULT_ROOT_PATH = Path(os.path.expanduser(os.getenv(\"CHIA_ROOT\", \"~/.chia$num/mainnet\"))).resolve()\n" >> $HOME/chia-blockchain$num/chia/util/default_root.py
echo -e "DEFAULT_KEYS_ROOT_PATH = Path(os.path.expanduser(os.getenv(\"CHIA_KEYS_ROOT\", \"~/.chia_keys$num\"))).resolve()" >> $HOME/chia-blockchain$num/chia/util/default_root.py
cd $HOME/chia-blockchain$num/ && sh install.sh && . ./activate && chia init && chia init --fix-ssl-permissions && cd ..
chia configure --testnet true
sed -ri 's/^(\s*)(daemon_port\s*:\s*55400\s*$)/\1daemon_port: '"5540$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
sed -ri 's/^(\s*)(port\s*:\s*8449\s*$)/\1port: '"85$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
sed -ri 's/^(\s*)(rpc_port\s*:\s*9256\s*$)/\1rpc_port: '"93$num"'/' $HOME/.chia$num/mainnet/config/config.yaml
deactivate
done
