while true
do
	echo "wait for vrg/ci clusterdataready"
	kubectl -n cpd-instance wait vrg/ci --for condition=clusterdataready --timeout 0m
	echo "wait for vrg/ci dataready"
	kubectl -n cpd-instance wait vrg/ci --for condition=dataready --timeout 0m
#	echo "wait for vrg/co clusterdataready"
#	kubectl -n cpd-operators wait vrg/co --for condition=clusterdataready --timeout 0m
#	echo "wait for vrg/co dataready"
#	kubectl -n cpd-operators wait vrg/co --for condition=dataready --timeout 0m
	sleep 3
done
