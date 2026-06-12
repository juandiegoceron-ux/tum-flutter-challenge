FROM ghcr.io/cirruslabs/flutter:3.22.0

WORKDIR /app

# Expose the web server port
EXPOSE 8080

# Script to initialize flutter project if missing, and run web server
RUN echo '#!/bin/bash\n\
if [ ! -d "web" ]; then\n\
  echo "Initializing Flutter project..."\n\
  flutter create .\n\
fi\n\
flutter pub get\n\
echo "Starting Flutter web server..."\n\
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080\n\
' > /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
