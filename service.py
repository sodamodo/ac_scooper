from psutil import process_iter

for proc in process_iter(['pid', 'name', 'username']):
    info = proc.info
    print(info)