import salt.utils.event

sock_dir = '/var/run/salt/master'
payload = {'sample-msg': 'testing stuff', 'example': 'same test'}
event = salt.utils.event.SaltEvent('master', sock_dir)
event.fire_event(payload, 'salt/testeventtag')
