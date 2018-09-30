SERVER=10.10.0.21
NEWLINE=UNIX

dnsmasq:
	sed -e 's|\(.*\)|server=/\1/$(SERVER)|' accelerated-domains.zju.raw.txt > accelerated-domains.zju.dnsmasq.conf

unbound:
	sed -e 's|\(.*\)|forward-zone:\n  name: "\1."\n  forward-addr: $(SERVER)\n|' accelerated-domains.zju.raw.txt > accelerated-domains.zju.unbound.conf
ifeq ($(NEWLINE),DOS)
	sed -i 's/\r*$$/\r/' accelerated-domains.zju.unbound.conf
endif

bind:
	sed -e 's|\(.*\)|zone "\1." {type forward; forwarders { $(SERVER); }; };|' accelerated-domains.zju.raw.txt > accelerated-domains.zju.bind.conf
ifeq ($(NEWLINE),DOS)
	sed -i 's/\r*$$/\r/' accelerated-domains.zju.bind.conf
endif

dnscrypt-proxy:
	sed -e 's|\(.*\)|\1 $(SERVER)|' accelerated-domains.zju.raw.txt > dnscrypt-proxy-forwarding-rules.txt
ifeq ($(NEWLINE),DOS)
	sed -i 's/\r*$$/\r/' dnscrypt-proxy-forwarding-rules.txt
endif

dnsforwarder6:
	{ printf "protocol udp\nserver $(SERVER)\nparallel on \n"; cat accelerated-domains.zju.raw.txt; } > accelerated-domains.zju.dnsforwarder.conf
ifeq ($(NEWLINE),DOS)
	sed -i 's/\r*$$/\r/' accelerated-domains.zju.dnsforwarder.conf
endif

clean:
	rm -f accelerated-domains.zju.{dnsmasq,unbound,bind}.conf dnscrypt-proxy-forwarding-rules.txt
