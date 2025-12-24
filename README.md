# Application Deployment and Monitoring

## Overview
This project demonstrates a complete CI/CD and monitoring setup for a containerized application.  
It leverages **Docker Compose** for deployment, **Jenkins** for automated builds and image pushes, and **Prometheus + Grafana** for monitoring.

---

## 🚀 Deployment
- The application is deployed on an **AWS EC2 instance** using **Docker Compose**.
- Services include:
  - Application container
  - Prometheus
  - Grafana
  - Node Exporter
  - Blackbox Exporter

---

## ⚙️ CI/CD Pipeline
- **Jenkins** is used to automate the build and deployment process.
- On every push to GitHub:
  - Jenkins builds a new Docker image.
  - The image is tagged based on the branch.
  - Images are pushed to **DockerHub** (different repos for `dev` and `main` branches).

---

## 📊 Monitoring
- **Prometheus** scrapes metrics from:
  - **Node Exporter** → host-level metrics (CPU, memory, disk, network).
  - **Blackbox Exporter** → application uptime and HTTP probe metrics.
- **Grafana** provides dashboards and visualizations for real-time monitoring.

---

## 🔑 Key Features
- Automated builds and DockerHub pushes based on GitHub branch.
- Seamless deployment with Docker Compose on EC2.
- Robust monitoring with Prometheus and Grafana.
- Health checks via Node Exporter and Blackbox Exporter.

---

