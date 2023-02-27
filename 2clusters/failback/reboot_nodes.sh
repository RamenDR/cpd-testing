source env.sh
/nfs/OCP-installer/oclogincluster $primary
nodes=$(kubectl get nodes  | grep worker | awk '{print $1}')
for node in $nodes
do
	echo $node
	oc adm cordon $node
	oc adm drain $node --ignore-daemonsets --delete-emptydir-data --force
	oc debug node/$node
	oc adm uncordon $node
	sleep 5
        oc get node/$node
done
sleep 10
oc get pods -A | egrep -v 'Running|Completed'
#chroot /host
#systemctl reboot
