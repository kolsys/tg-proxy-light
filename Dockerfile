FROM telegrammessenger/proxy:latest

# Download Telegram configuration files during the image build process
RUN curl -s https://core.telegram.org/getProxySecret -o /etc/telegram/hello-explorers-how-are-you-doing && \
    curl -s https://core.telegram.org/getProxyConfig -o /etc/telegram/backend.conf

# Copy our optimized startup script, overwriting the original one
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Override CMD to use our script
CMD ["/bin/bash", "/run.sh"]