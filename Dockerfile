FROM rockylinux:9

# Metadata about the image
LABEL maintainer="The Contos project"

# Install Apache HTTP server
RUN yum -y install httpd \
    && yum clean all \
    && rm -rf /var/www/html/*

# Copy the HTML file into the web server's document root
COPY index.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Use JSON array form for CMD
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
