### This project is educational and is marked public exclusively to show  my progress as a developer since december 2020. ###

---
## Kubernetes services ##

This project creates kubernetes services network:

- Mysql Database
    - listen to port 
    - holds payload's data
    - keeps data when pod is restarted
- Wordpress site - actual payload that could be publicly used
    - available on port 5050
    - created new with the fresh start
- Phpmyadmin site - for easy access to database data
    - available on port 5000
    - created new with the fresh start
- nginx
    - port 80 redirects to 443
    - port 443 uses ssl
    - on route `/wordpress` does redirect to the wordpress site
    - on route `/phpmyadmin` does reverse proxy to phpmyadmin site
    - on route `/` shows different site
- InfluxDB
    - has telegraf collecting k8s data
    - keeps data when pod is restarted
- Grafana
    - available on port 3000
    - connected to influxDB
    - have dashboard for every container
- FTPS
    - available on port 21
    - uses ssl
    
#### Requirements ####

- `minikube` and `kubectl` to run k8s
- `docker` for containers
- `virtualbox` for virtualization
- 2200MB free memory
- 10GB free disk space

#### Usage ####

launch `setup.sh` to run    

on successful start, starts kubernetes dashboard in default browser.

Expected start time: 10 min.
