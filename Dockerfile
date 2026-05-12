FROM hashicorp/terraform:1.10.0

RUN apk add --no-cache \
    bash \
    curl \
    unzip \
    groff \
    less \
 && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
 && unzip awscliv2.zip \
 && ./aws/install \
 && rm -rf aws awscliv2.zip

ENTRYPOINT ["terraform"]
CMD ["--help"]