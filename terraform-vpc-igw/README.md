# ------------------------------------------
# Test de Stress
# ------------------------------------------
https://www.wellarchitectedlabs.com/performance-efficiency/100_labs/100_monitoring_linux_ec2_cloudwatch/5_generating_load/

sudo amazon-linux-extras install epel -y
sudo yum install stress -y

sudo stress --cpu 8 --vm-bytes $(awk '/MemAvailable/{printf "%d\n", $2 * 0.9;}' < /proc/meminfo)k --vm-keep -m 1

# ------------------------------------------
# UserData
# ------------------------------------------
https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/user-data.html

# ------------------------------------------
# ------------------------------------------