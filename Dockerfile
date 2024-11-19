# Base Image
FROM nvidia/cuda:11.8.0-base-ubuntu20.04

# Maintainer Information
LABEL maintainer="Your Name <your-email@example.com>"

# Update system and install dependencies
RUN apt-get update && \
    apt-get install -y wget curl build-essential && \
    apt-get clean

# Install NVIDIA Drivers
RUN apt-get install -y nvidia-driver-535

# Set CUDA environment variables
ENV PATH=/usr/local/cuda/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# Add Kryptex installer to the container
COPY kryptex.deb /tmp/kryptex.deb

# Install Kryptex
RUN dpkg -i /tmp/kryptex.deb || apt-get install -f -y

# Expose required ports (if any)
EXPOSE 3333

# Start Kryptex software
CMD ["/usr/bin/kryptex"]
