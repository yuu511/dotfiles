# Install & export idf stuffs
apt update && apt install -y clang-tidy
pip install -U pyclang # dunno if this is necessary; i just took this from another person's solution :v) )
idf_tools.py install esp-clang
. ${IDF_PATH}/export.sh
