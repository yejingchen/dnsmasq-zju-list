dnsmasq-zju-list
================

Configurations for your favorite DNS server to forward domains in Zhejiang
University to zju's DNS server. Originated from `felixonmars/dnsmasq-china-list 
<https://github.com/felixonmars/dnsmasq-china-list>`_. Pull requests and issues
are welcomed.

Currently supports:

 - dnsmasq

 - unbound

 - bind

 - dnscypt-proxy

 - dnsforwarder6

Usage
=====

 1. (optional) Modify the list if needed.
 
 2. Generate config file:

    .. code:: sh

      # use DNS server 10.10.0.21, make dnsmasq config
      make SERVER=10.10.0.21 dnsmasq
      # or if you use unbound
      make unbound

    Then move the generated files to ``/etc/dnsmasq.d`` or corresponding places,
    and *include* them in main config file.

License
=======

.. code::

   Copyright © 2018 Ye Jingchen <ye.jingchen[at]gmail.com>
   This work is free. You can redistribute it and/or modify it under the
   terms of the Do What The Fuck You Want To Public License, Version 2,
   as published by Sam Hocevar. See the LICENSE file for more details.
