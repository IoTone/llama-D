#
# Grab the current master commit
#
# 
curl -L -o libkeccak-tiny.zip https://github.com/IoTone/keccak-tiny/archive/singlefile.zip
unzip singlefile.zip
cd llama.cpp-singlefile
make LLAMA_OPENBLAS=1
# TODO: determine what library gets linked
# cp llama* ..
cd ..
