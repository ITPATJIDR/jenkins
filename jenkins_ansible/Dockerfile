# Use the official Jenkins image as base
FROM jenkins/jenkins:lts

# Switch to root to install Ansible
USER root

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        git \
        python3 \
        python3-pip \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Add Ansible repository key and source list entry
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && echo "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list

# Install Ansible
RUN apt-get update \
    && apt-get install -y ansible \
    && rm -rf /var/lib/apt/lists/*

# Switch back to Jenkins user
USER jenkins


