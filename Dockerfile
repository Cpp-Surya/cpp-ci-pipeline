# Stage 1: Build stage
FROM ubuntu:22.04 AS build
RUN apt-get update && apt-get install -y g++ cmake libgtest-dev
WORKDIR /app
COPY . .
RUN rm -rf build
RUN mkdir build && cd build && cmake .. && make

# Stage 2: Runtime stage
FROM ubuntu:22.04
WORKDIR /app
COPY --from=build /app/build/hello_ci /app/hello_ci
CMD ["./hello_ci"]
