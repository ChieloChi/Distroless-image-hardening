
#  Distroless Image Hardening — Node.js Todo App

This project demonstrates how to **build, harden, and scan** a Node.js application using **Distroless images** for improved security.

It includes:
- A **multi-stage Docker build** (builder + distroless runtime)
- Secure permissions for SQLite persistence
- **Trivy scanning** for vulnerability assessment
- Minimal image footprint for production



## Project Overview

This Node.js app is a simple **Todo API**, backed by a SQLite database.
The main focus is to showcase how to:
1. Build a small, secure container image
2. Eliminate OS-level attack surfaces
3. Verify image security using **Trivy**



##  Tech Stack

- **Node.js 18**
- **SQLite**
- **Distroless (gcr.io/distroless/nodejs18)**
- **Docker**
- **Trivy**



##  Build Steps

### 1️⃣ Clone the repo

```bash
git clone https://github.com/ChieloChi/Distroless-image-hardening.git
cd Distroless-image-hardening
````

### 2️⃣ Build the image

```bash
docker build -t chielochi/gt-app:latest .
```

### 3️⃣ Run the container

```bash
docker run -d --name gt-app -p 3000:3000 chielochi/gt-app:latest
```

Check logs:

```bash
docker logs -f gt-app
```

You should see:

```
Using sqlite database at /etc/todos/todo.db
Listening on port 3000
```

### 4️⃣ Test the app

```bash
curl http://localhost:3000
```

---

## Dockerfile Highlights

* **Multi-stage build** ensures only production dependencies are included.
* **Distroless image** removes shells, package managers, and OS utilities.
* **Writable directory setup** allows SQLite to function properly.



## can with Trivy

Install Trivy (on Ubuntu):

```bash
sudo apt install wget -y
wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.67.2_Linux-64bit.deb
sudo dpkg -i trivy_0.67.2_Linux-64bit.deb
```

Scan the built image:

```bash
trivy image chielochi/gt-app:latest
```


## Key Takeaways

✅ Distroless images drastically reduce attack surfaces
✅ SQLite runs securely with correct permissions
✅ Trivy scanning ensures ongoing vulnerability visibility
✅ Minimal runtime dependencies = faster, safer deployment






## Author

**Chielo Chi**
🔗 [GitHub](https://github.com/ChieloChi)



## 🏁 License

MIT License © 2025 Chielo Chi


Would you like me to add a **Trivy scan result example section** (e.g., sample output and interpretation) to make it more complete?
```
