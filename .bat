✅ Commands to Remember (Save in .bat)
Create a .bat file (e.g., start_all.bat) inside your alpha_code_runner folder:

bat

start cmd /k "cd /d D:\alpha_code_runner && node server.js"
start cmd /k "cd /d D:\alpha_code_runner && docker-compose up"
This will launch:

Terminal 1 → node server.js

Terminal 2 → docker-compose up

🛑 To Stop Services
1. Stop alpha_code_runner
Just press Ctrl + C in its terminal.

If still stuck:


netstat -ano | findstr :2358
taskkill /PID <PID> /F
2. Stop Judge0 containers:
In Docker terminal:

Ctrl + C
Then:


docker-compose down
If you want to automate this before running your server, add this to your .bat script:

bat
Copy
Edit
@echo off
echo Killing any process using port 2358...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :2358') do taskkill /PID %%a /F >nul 2>&1

echo Starting Docker Compose...
docker-compose up
