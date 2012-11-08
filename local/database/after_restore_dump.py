from django.contrib.auth.models import User
u = User.objects.get(username='admin')
u.set_password('ok')
u.save()

import commands
ip = commands.getoutput("/sbin/ifconfig").split("\n")[1].split()[1][5:]

from django.contrib.sites.models import Site
site = Site.objects.all()[0]
site.domain = site.name = ip + ':8000'
site.save()