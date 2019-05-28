snap: 
	for x in {"master","worker0","worker1"}; do \
		virsh --connect qemu:///system snapshot-create-as --domain "k8s-cluster_$$x" --name $$x --atomic ; \
	done
restore: 
	for x in {"master","worker0","worker1"}; do \
		virsh --connect qemu:///system snapshot-revert --domain "k8s-cluster_$$x" --snapshotname $$x ; \
	done
